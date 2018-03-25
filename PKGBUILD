# Maintainer: David Runge <dave@sleepmap.de>
_name=IanniX
pkgname=iannix
pkgver=0.9.20b
pkgrel=1
pkgdesc="A graphical open-source sequencer, based on Iannis Xenakis works, for digital art"
arch=('x86_64')
url="https://www.iannix.org/"
license=('GPL')
groups=('pro-audio')
depends=('alsa-lib' 'gdk-pixbuf2' 'glu' 'qt5-script')
makedepends=('qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buzzinglight/${pkgname}/archive/v${pkgver/b/-b}.tar.gz")
sha512sums=('9c46250bce9550abc4ece11720616f217513aefd62a7144f7aebdaf2e11b938dc2a551d066b748089bafffd8f7d9659e8b79f6318e250e522cf608f861951c90')

prepare() {
  mv -v "${_name}-${pkgver/b/-b}" "${pkgname}-${pkgver}"
}

build() {
  cd "$pkgname-$pkgver"
  PREFIX="/usr" qmake-qt5
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="${pkgdir}/" install
  install -vDm 644 Readme.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
