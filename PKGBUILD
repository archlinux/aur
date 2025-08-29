# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.6.4
pkgrel=1
pkgdesc='Qt-based graphical user interface for the journalctl command'
arch=('x86_64')
url='https://github.com/pentix/qjournalctl'
license=('GPL3')
depends=('hicolor-icon-theme' 'libssh' 'qt5-base')
makedepends=('imagemagick')
source=("https://github.com/pentix/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8f456e599d5b54f8463e18e2880129393ba65a5e5dbdde19c893291f9ab92cb3')

prepare() {
  cd $pkgname-$pkgver
  convert ui/qjournalctl.png +set date:create +set date:modify -resize 64x64 -alpha on ui/qjournalctl-64x64.png
  convert ui/qjournalctl.png +set date:create +set date:modify -resize 96x96 -alpha on ui/qjournalctl-96x96.png
  sed -i '/^INSTALLS/ s/desktop-icon//' qjournalctl.pro
}

build() {
  cd $pkgname-$pkgver
  qmake-qt5 qjournalctl.pro
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ui/qjournalctl-64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/qjournalctl.png"
  install -Dm644 ui/qjournalctl-96x96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/qjournalctl.png"
}
