# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

pkgname=numlockl
pkgver=1.0.6
pkgrel=1
pkgdesc='Turns on the numlock key.'
arch=('x86_64')
url='https://gitlab.com/phoepsilonix/numlockl'
license=('MIT')
depends=('glibc')
source=(https://gitlab.com/phoepsilonix/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz
        LICENSE)
sha512sums=('1385a868d1bf30c88216b187cbc3fdfe329667a87a1b1b8fda296907a3ecc3884b14c4883db249dac5bcfbcf735d2f727a5f2e3528fee2e93654d7ca0a319674'
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
