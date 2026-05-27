pkgname=forum-scout-qt
pkgver=0.5.2
pkgrel=1
pkgdesc="Arch-focused multi-forum search tool (Qt/PyQt6 edition)"
arch=('any')
url="https://github.com/musqz/forum-scout-qt"
license=('MIT')
provides=('forum-scout')
conflicts=('forum-scout')
depends=(
  'python-pyqt6'
  'python-requests'
)
checkdepends=('desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a234f81fa3d9618d536f008ece95ac875e4dcbf7accf9e3802d0b286535aebcd')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/__VERSION__/$pkgver/" "$pkgname.py"
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate "$pkgname.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/forum-scout"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 translations/*.json -t "$pkgdir/usr/share/forum-scout/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
