# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Nils Bars <nils@nbars.de>

pkgname=cutecom
_pkgver=0.60.0-RC1
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="A graphical serial terminal"
arch=(i686 x86_64 aarch64)
url="https://gitlab.com/cutecom/cutecom"
license=(GPL-3.0-only)
depends=(gcc-libs glibc hicolor-icon-theme 'qt6-base>=6.6' qt6-serialport)
makedepends=('cmake>=3.5' patch)
source=(${pkgname}-v${pkgver}.tar.gz::https://gitlab.com/cutecom/cutecom/-/archive/v${_pkgver}/${pkgname}-v${_pkgver}.tar.gz
        fix_lrzsz.patch)
sha256sums=('955c385cbcfdc5035d445104b6488bb95de5a28403c5a5745ab7863f32bc3419'
            '2a17cc4604c111e95115ad5e60199ae08cfd6e6c92e41181d971f410d828ec6e')

prepare() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"

  patch -Np0 -i "${srcdir}/fix_lrzsz.patch"
}

build() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"

  mkdir build
  cd build

  cmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${_pkgver}"

  install -Dm644 cutecom.desktop "${pkgdir}/usr/share/applications/cutecom.desktop"
  install -Dm644 images/cutecom.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cutecom.svg"
  install -Dm755 build/cutecom "${pkgdir}/usr/bin/cutecom"
  install -Dm644 cutecom.1 "${pkgdir}/usr/share/man/man1/cutecom.1"
}
