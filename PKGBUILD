# Maintainer: Souper <me at supertransformer dot se>
pkgname=soup-launcher
pkgver=0.1.6
pkgrel=1
_srcname="SoupLauncher-$pkgver"
pkgdesc='Soup Launcher is a custom Minecraft launcher specifically designed for Modded Minecraft.'
arch=('x86_64')
url="https://github.com/supertransformer/SoupLauncher"
license=('GPL3')
depends=('electron')
makedepends=('nodejs' 'npm' 'git' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('df41429cf1f256a0a1c1034123c8f0a20a1448e3fbb21517f36e8fb352ed592147f651f53d6bbc985c0114dac58d1e4fd9e81fd20e918b153347781dacaa986d')

prepare() {
	cd "$_srcname"
	npm install
}

build() {
	cd "$_srcname"
	mkdir -p "release-builds"
	npm run package-linux
}

package() {
	cd "$_srcname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "assets/icons/png/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	install -Dm644 "release-builds/$pkgname-linux-x64/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
}