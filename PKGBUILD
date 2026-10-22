# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=forum-scout
pkgver=0.6.6
pkgrel=2
pkgdesc="Arch focused forum search tool (GTK4)"
arch=('any')
url="https://codeberg.org/linux-bird/forum-scout"
license=('MIT')
conflicts=('forum-scout-qt')
depends=(
  'gtk4'
  'python-gobject'
  'python-requests'
)
checkdepends=('desktop-file-utils')
source=("forum-scout-$pkgver-codeberg.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b25188d68ab910ef1be0594d05a0b8fe7d817d58bb9058d2c4ac9ab4f33e43eb')

prepare() {
  cd "forum-scout"
  sed -i "s/__VERSION__/$pkgver/" "forum-scout.py"
}

check() {
  cd "forum-scout"
  desktop-file-validate "forum-scout.desktop"
}

package() {
  cd "forum-scout"
  install -Dm755 "forum-scout.py" "$pkgdir/usr/bin/forum-scout"
  install -Dm644 "forum-scout.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 forums.conf -t "$pkgdir/usr/share/forum-scout/"
  install -Dm644 translations/*.json -t "$pkgdir/usr/share/forum-scout/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/forum-scout/"
}
