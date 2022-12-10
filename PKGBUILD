# Maintainer: éclairevoyant
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo at gmail dot com>

pkgname='trello'
_gitname="$pkgname-desktop"
pkgver=0.1.9
pkgrel=5
pkgdesc='Unofficial Trello Desktop app'
arch=('any')
url="https://github.com/danielchatfield/$_gitname"
license=('MIT')
depends=('electron17')
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
b2sums=('fffd16c5defca8565b2c519e66f8be228cce42d9dbe50851ac146190e35dd71c995328abb0d23b58c405dd019a69ba4b1c462af8f86c906ee6ec12985fff19f3'
        '46d0318c1761db122f0ae37fd914a986964226fc811efacbe74249813ce18f96800ac784ecbbe829d3d48961f7f9fd16abfd0db28e9add1c3de0588d7337b8ea'
        '92986fa91e3471d7bbaa9f9f3492a20112483ce69401738c8d0b035996890ff7c2818ddeb3a4fa32b75c0a4ddd2125e80c19409ff408cda15342ec19f9f5f191')

prepare() {
	cd $_gitname-$pkgver
	yarn install --prod
}

package() {
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"

	cd $_gitname-$pkgver
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 static/Icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -dm755 "$pkgdir/usr/lib/"
	cp -r . "$pkgdir/usr/lib/trello"
	rm -rf "$pkgdir/usr/lib/trello/media"
	rm "$pkgdir/usr/lib/trello/LICENSE"
}
