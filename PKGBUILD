# Maintainer: 0fflineuser <0fflineuser@cock.li>
pkgname=radion
pkgver=1.2.0
pkgrel=2
pkgdesc="CLI internet radio client in Bash with optional yad desktop notifications."
arch=('x86_64')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL-2.0-or-later')
depends=("bash" "mpv" "sox" )
install=proto.install
optdepends=("fzf" "rofi" "dmenu" "yad")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d35101f0be1d242b8fbf3c68148f524588f6faf8647bd70f82ca266bb58fc0ea')

prepare() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname/"
  mkdir -p "$pkgdir/usr/share/$pkgname/mpv"
  cp stations.txt "$pkgdir/usr/share/$pkgname/"
  cp radion-rofi-theme.rasi "$pkgdir/usr/share/$pkgname/"
  cp -r png/ "$pkgdir/usr/share/$pkgname/"
  cp icecast-logger.lua -t "$pkgdir/usr/share/$pkgname/mpv/"

  install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname.conf"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname.sh"
  install -Dm755 record-toggle.sh "$pkgdir/usr/bin/record-toggle.sh"
}
