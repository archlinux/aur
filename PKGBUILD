# Maintainer: NorthWestWind <nw@northwestw.in>
pkgname=striim-deck
pkgver=1.1.0
pkgrel=1
pkgdesc='Wii U "stream deck" using a website'
arch=("i686" "x86_64")
url="https://codeberg.org/NorthWestWind/striim-deck"
license=('GPL3')
makedepends=("go" "nodejs" "npm")
source=("$url/archive/v$pkgver.tar.gz" "striim-deck.desktop")
sha256sums=("47a6fdfd8b562f83bb2281e37e2e767cb74bf747b447aa674ccbb1374fd38bee"
						"bebba34f0a22d3add69c2e4a55e8e02f2fbf53edd72c43174ed039431707a575")

prepare() {
  export CGO_ENABLED=1
	cd "$srcdir/$pkgname/client"
	npm i
}

build() {
	cd "$srcdir/$pkgname/client"
	node build.js
	cd ..
	go build -o "$pkgname"
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/$pkgname/client/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm755 "$srcdir/$pkgname/client/dist/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
