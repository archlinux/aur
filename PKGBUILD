# Maintainer: Eric Bakker <musqz at mf dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=forum-scout
pkgver=0.6.0
pkgrel=1
pkgdesc="Arch focused forum search tool"
arch=('any')
url="https://github.com/musqz/forum-scout"
license=('MIT')
depends=(
  'gtk3'
  'python-gobject'
  'python-requests'
)
checkdepends=('desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1db1cc526928379b3f76c4c1a76f16ffde76df14fe12c16ca7903a8204c91647')

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
  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 forums.conf -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 translations/*.json -t "$pkgdir/usr/share/$pkgname/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
