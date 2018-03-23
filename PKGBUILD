# Maintainer: David Runge <dave@sleepmap.de>
pkgname=qxgedit
pkgver=0.5.0
pkgrel=1
pkgdesc="GUI for editing MIDI System Exclusive files for XG devices (eg. Yamaha DB50XG)"
arch=('x86_64')
url="https://qxgedit.sourceforge.io/"
license=('GPL2')
groups=('pro-audio')
depends=('alsa-lib' 'hicolor-icon-theme' 'qt5-base')
makedepends=('qt5-tools')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1122aed65d9db668dc6fc0015709d9a7ed9072b980aaaac668d26da5a3438ae102134f021d79e9ca948ed59242b6642549a220e3592bb641a8a4fa912c86cafe')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {AUTHORS,ChangeLog,README,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
