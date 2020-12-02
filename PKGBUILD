# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.6.7
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url="https://flavio.tordini.org/minitube"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-declarative' 'qt5-x11extras')
makedepends=('mpv' 'qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('dfde3d90d2f5eada6d6683aa5f4d05bb9ebcef7ecc50f464665cee91eb9e10981659fb666f587c8744148d501a4414dbae068e82019e7b25fc420d2782d0dddd')
b2sums=('8f401835dd432b3d5d0e19e2eacfe47c00f6a2b847082d9fbdc64fa0a79d656db814b28a3895b9eb50d1bedba7a65f03b2c91349426469fd95cabb98c921b294')

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
