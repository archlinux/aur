# Maintainer: NorthWestWind <nw@northwestw.in>
pkgname=striim-deck
pkgver=1.2.0
pkgrel=1
pkgdesc='Wii U "stream deck" using a website'
arch=("i686" "x86_64")
url="https://codeberg.org/NorthWestWind/striim-deck"
license=('GPL3')
makedepends=("go")
source=("$url/archive/v$pkgver.tar.gz" "$url/releases/download/v$pkgver/client.zip" "striim-deck.desktop")
sha256sums=("a85e581e38a40a2cc2da62ba301dca87bc4dc5ad100681339769e7fcf283a7a1"
						"aa0c71c7257f3ecdd6d1c3c2eee4559619cd8c899765184501ce3e09d8ad0442"
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
