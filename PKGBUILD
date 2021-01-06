# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.7
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url="https://flavio.tordini.org/minitube"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-declarative' 'qt5-x11extras')
makedepends=('mpv' 'qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('11c9012236dac97b8f710f0056229c912b75adfcb2d0931eebd14a78f23ac8c86fdf63ff2884ae9e306bc6c67f571ea17935cff5f5696c61f2e1d27d8751a621')
b2sums=('f077f770aeee1f060d06572085ae1e18ceb42fd91916a416940ff20311cd1fc7685ddf6c1a049b7f4bf12980508554ee370339cfb85c42d9ebe48457d1a19208')

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
