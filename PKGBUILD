# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.9.2
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url="https://flavio.tordini.org/minitube"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-declarative' 'qt5-x11extras')
makedepends=('mpv' 'qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('5d4ee6c5a6ac8848bd553ab2a70e59b30b5b4c41ee1a4a8ddc8ee03eb6ab5ee55fad5d4decb7dfd35cd537cca12ea0356bcfadd7c6180bcf8825273ee051e228')
b2sums=('e7cb155a6c4e1dcac9dcc1f522a70d9300a205116faa5f1576fec41ec8e3370ec72fb30c6c674d0100c0cd7cd6e5c07e38811ddb4daca25d716ff7c009629c78')

build() {
  cd "${pkgname}-${pkgver}"
  qmake
}

package() {
  depends+=('libmpv.so')

  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}/"
  install -vDm 644 {AUTHORS,CHANGES,README.md,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
