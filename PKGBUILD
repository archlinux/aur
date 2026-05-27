pkgname=forum-scout-qt
pkgver=0.5.1
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
sha256sums=('c01c32aa574e11d675c4574ea55155aaf3c99d7355b486a3b6603091230571e2')

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
