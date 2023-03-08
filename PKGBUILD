# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>

pkgname=numlockl
pkgver=1.0.8
pkgrel=1
pkgdesc='Turns on the numlock key.'
arch=('x86_64')
url='https://gitlab.com/phoepsilonix/numlockl'
license=('MIT')
depends=('glibc')
source=(https://gitlab.com/phoepsilonix/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz
        LICENSE)
sha512sums=('06ec467f921a5028fb8aebc08cd24d4abe5872fc26d4ec6487150f4e0d1e7c6bb33a5910edc0b714f1385957a2c93281b642d4e7b51b2586048ce0c645c214d0'
            'c5ac1d5ef4e6b12206d27369087fca7d39cedc2ad3cd625caa5b5c558ab003195a8158ab19206b89e0ccbd4e9c1b39348a72923ba2c35c8d33fc603fae3f4bd8')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  if [[ $CC == "clang" ]];then
    CFLAGS+=" -flto=full -Os"
    LDFLAGS+=" -flto=full -Os"
  fi

  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  make prefix="${pkgdir}/usr" install
  
  # Install the custom MIT license
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
