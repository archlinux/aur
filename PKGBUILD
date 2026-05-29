# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=forum-scout
pkgver=0.6.0
pkgrel=2
pkgdesc="Arch focused forum search tool (GTK4)"
arch=('any')
url="https://github.com/musqz/forum-scout-gtk4"
license=('MIT')
conflicts=('forum-scout-gtk4')
depends=(
  'gtk4'
  'python-gobject'
  'python-requests'
)
checkdepends=('desktop-file-utils')
source=("forum-scout-gtk4-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a025b5b8d605886d783075e9942124f4b2e9b8844d26ca6f4d3b37b2c5b66f90')

prepare() {
  cd "forum-scout-gtk4-$pkgver"
  sed -i "s/__VERSION__/$pkgver/" "forum-scout.py"
}

check() {
  cd "forum-scout-gtk4-$pkgver"
  desktop-file-validate "forum-scout.desktop"
}

package() {
  cd "forum-scout-gtk4-$pkgver"
  install -Dm755 "forum-scout.py" "$pkgdir/usr/bin/forum-scout"
  install -Dm644 "forum-scout.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 forums.conf -t "$pkgdir/usr/share/forum-scout/"
  install -Dm644 translations/*.json -t "$pkgdir/usr/share/forum-scout/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/forum-scout/"
}
