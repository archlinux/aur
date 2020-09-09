# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.6
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url="https://flavio.tordini.org/minitube"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-declarative' 'qt5-x11extras')
makedepends=('mpv' 'qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('4821452058edfedaa29adb091c3a16e8ce2bccb69cc45d77aa0d565c50350d30c085c250b937821cea4b22013a7e340ede91df69a9dd7d55e1a68038fc453271')
b2sums=('3b31ab7371a052b56c7f2235bd91644f40aeb404c0524f14fb0598ceece9bf4fd7cf1062b0881bc6f7205e105dafaefa1589d5bd05768d63d6914a3ac62cf899')

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
