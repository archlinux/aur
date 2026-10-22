# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=forum-scout-qt
pkgver=0.6.6
pkgrel=2
pkgdesc="Arch-focused multi-forum search tool (Qt/PyQt6 edition)"
arch=('any')
url="https://codeberg.org/linux-bird/forum-scout-qt"
license=('MIT')
provides=('forum-scout')
conflicts=('forum-scout')
depends=(
  'python-pyqt6'
  'python-requests'
)
checkdepends=('desktop-file-utils')
source=("$pkgname-$pkgver-codeberg.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa7482db6bdcb70e9eb02550877fe6ef4be6a338808d36fa5deab57fb892bfcd')

prepare() {
  cd "$pkgname"
  sed -i "s/__VERSION__/$pkgver/" "$pkgname.py"
}

check() {
  cd "$pkgname"
  desktop-file-validate "forum-scout.desktop"
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/forum-scout"
  install -Dm644 "forum-scout.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 forums.conf -t "$pkgdir/usr/share/forum-scout/"
  install -Dm644 translations/*.json -t "$pkgdir/usr/share/forum-scout/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
