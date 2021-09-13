# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.9.1
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url="https://flavio.tordini.org/minitube"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-declarative' 'qt5-x11extras')
makedepends=('mpv' 'qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('3aca8e431580f65e33287a084be87aa55cfbbb88d4ae585bbc7eab717ee19301f23f7ee6e770dc2cd37f8ba033bd7a958c5d7b1e907df25489fcbe0e8d143357')
b2sums=('9abe09b66ebc1563b46ec6d05b04f5ac996e3c27ca6e1bffd7231b586f9b63e009b5525e5693a81c11bdf98f1ff3a7aa40d1b89a96d483a1efd6086a50bc0527')

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
