# Maintainer: TheDalaiAlpaca dleeg at tutanota dot com
# Issues: https://gitlab.com/TheDalaiAlpaca/sat-yt/-/issues

_pkgname="sat-yt"
pkgname="$_pkgname"-git
pkgver=0.1.2
pkgrel=2
pkgdesc="Youtube plugin for saturnon"
arch=('i686' 'x86_64')
url="https://gitlab.com/TheDalaiAlpaca/sat-yt"
license=('GPL3')
depends=('youtube-dl' 'mpv' 'jq') 
optdepends=()
md5sums=(SKIP)
source=("https://gitlab.com/TheDalaiAlpaca/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")

build() {
	cd "$_pkgname-$pkgver"

	cargo build --release
}

package() {
	cd "$_pkgname-$pkgver"

	install -Dm 755 -t "$pkgdir/usr/bin"               "target/release/sat-yt"
	install -Dm 644 -t "$pkgdir/etc/saturnon"          "youtube.conf"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/refresh"
	install -Dm 755 -t "$pkgdir/usr/share/saturnon"    "scripts/subscribe"
}
