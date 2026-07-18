# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=forum-scout
pkgver=0.6.6
pkgrel=1
pkgdesc="Arch focused forum search tool (GTK4)"
arch=('any')
url="https://github.com/musqz/forum-scout"
license=('MIT')
conflicts=('forum-scout-qt')
depends=(
  'gtk4'
  'python-gobject'
  'python-requests'
)
checkdepends=('desktop-file-utils')
source=("forum-scout-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d18356ecfd220af1e286e4e090eb33a19624c22c47e052858650b4788bcc12c1')

prepare() {
  cd "forum-scout-$pkgver"
  sed -i "s/__VERSION__/$pkgver/" "forum-scout.py"
}

check() {
  cd "forum-scout-$pkgver"
  desktop-file-validate "forum-scout.desktop"
}

package() {
  cd "forum-scout-$pkgver"
  install -Dm755 "forum-scout.py" "$pkgdir/usr/bin/forum-scout"
  install -Dm644 "forum-scout.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 forums.conf -t "$pkgdir/usr/share/forum-scout/"
  install -Dm644 translations/*.json -t "$pkgdir/usr/share/forum-scout/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/forum-scout/"
}
