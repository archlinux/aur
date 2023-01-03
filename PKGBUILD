# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

pkgname=numlockl
pkgver=1.0.5
pkgrel=1
pkgdesc='Turns on the numlock key.'
arch=('x86_64')
url='https://github.com/phoepsilonix/numlockl'
license=('MIT')
depends=('libbsd')
source=(https://gitlab.com/phoepsilonix/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz
        LICENSE)
sha512sums=('cdbeec9dddeed8ab12e56052c566996430bad5e8231972e9a64bef9d2f94ad78d1b835a3784f24347fc8bb5d1e2f7fb2ea25edd9591a620361157f36a2e5ce93'
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
