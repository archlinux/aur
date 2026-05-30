# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=forum-scout-gtk4
pkgver=0.6.1
pkgrel=1
pkgdesc="Arch focused forum search tool (GTK4)"
arch=('any')
url="https://github.com/musqz/forum-scout-gtk4"
license=('MIT')
provides=('forum-scout')
conflicts=('forum-scout')
depends=(
  'gtk4'
  'python-gobject'
  'python-requests'
)
checkdepends=('desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8546799f40e67e2af012f9ae3e8d208dd2e4f1b6a16994eb5b252717521a2ba8')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/__VERSION__/$pkgver/" "forum-scout.py"
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate "forum-scout.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "forum-scout.py" "$pkgdir/usr/bin/forum-scout"
  install -Dm644 "forum-scout.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 forums.conf -t "$pkgdir/usr/share/forum-scout/"
  install -Dm644 translations/*.json -t "$pkgdir/usr/share/forum-scout/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/forum-scout/"
}
