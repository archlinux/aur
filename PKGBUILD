# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

pkgname=numlockl
pkgver=1.0.5
pkgrel=3
pkgdesc='Turns on the numlock key.'
arch=('x86_64')
url='https://gitlab.com/phoepsilonix/numlockl'
license=('MIT')
depends=('glibc')
source=(https://gitlab.com/phoepsilonix/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz
        LICENSE)
sha512sums=('16b721b9b7efeb42d32d42c43a62e1056bbe7b9878919a6d4562449ee2bb3e74f62b9e25a47c5cbe5d3b3a8ad782f67a28100d423fbcf978384482a0c71d79e7'
            'c5ac1d5ef4e6b12206d27369087fca7d39cedc2ad3cd625caa5b5c558ab003195a8158ab19206b89e0ccbd4e9c1b39348a72923ba2c35c8d33fc603fae3f4bd8')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  if [[ $CC == "clang" ]];then
    CFLAGS+=" -flto -Os"
    LDFLAGS+=" -flto -fuse-ld=lld"
  fi

  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  make prefix="${pkgdir}/usr" install
  
  # Install the custom MIT license
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
