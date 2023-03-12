# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.6.3
pkgrel=4
pkgdesc='Qt-based graphical user interface for the journalctl command'
arch=('x86_64')
url='https://github.com/pentix/qjournalctl'
license=('GPL3')
depends=('hicolor-icon-theme' 'libssh' 'qt5-base')
makedepends=('imagemagick')
source=("https://github.com/pentix/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'qjournalctl.appdata.xml')
sha256sums=('a8226177c72f3867b34eb5f7150c672d5e0a21ac5f808e64576c5771a097ef36'
            '8f82dfee83ef1b4b66661f54ea7fbf781c2f971fdbb83bed0d1ef8777324efaa')

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
  install -Dm644 ../qjournalctl.appdata.xml "$pkgdir/usr/share/metainfo/qjournalctl.appdata.xml"
}
