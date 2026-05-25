# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=forum-scout
pkgver=0.3.4
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2829320f41901d046fd3e4e4821cbdf399f5e36c6a2974c3374f18b3c86b2390')

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
  install -Dm644 translations/*.json -t "$pkgdir/usr/share/$pkgname/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
