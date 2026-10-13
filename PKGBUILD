# Maintainer: NorthWestWind <nw@northwestw.in>
pkgname=striim-deck
pkgver=1.3.0
pkgrel=1
pkgdesc='Wii U "stream deck" using a website'
arch=("i686" "x86_64")
url="https://codeberg.org/NorthWestWind/striim-deck"
license=('GPL3')
makedepends=("go")
source=("$url/archive/v$pkgver.tar.gz" "$url/releases/download/v$pkgver/client.zip" "striim-deck.desktop")
sha256sums=("1776679243621f74eb971985a14b7685d8eb277f3b73b2d45cfe99c77c3fd559"
						"c5d07b32e8467347651faee151b2deb20bd880ac0f1620ca9b1495b536c74c8c"
						"bebba34f0a22d3add69c2e4a55e8e02f2fbf53edd72c43174ed039431707a575")

prepare() {
  export CGO_ENABLED=1
	mv "$srcdir/dist" "$srcdir/$pkgname/client/dist"
}

build() {
	cd "$srcdir/$pkgname"
	go build -o "$pkgname"
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/$pkgname/client/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm755 "$srcdir/$pkgname/client/dist/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
