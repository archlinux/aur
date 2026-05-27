pkgname=forum-scout-qt
pkgver=0.5.0
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
sha256sums=('ae7dca1a1d0659e4d26002fada5e97e33132d21f21f838fb9cb042ae3963a028')

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
