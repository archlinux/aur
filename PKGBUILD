# Maintainer: Souper <me at supertransformer dot se>
pkgname=soup-launcher
pkgver=0.1.2
pkgrel=1
_srcname="SoupLauncher-$pkgver"
pkgdesc='Soup Launcher is a custom Minecraft launcher specifically designed for Modded Minecraft.'
arch=('x86_64')
url="https://github.com/supertransformer/SoupLauncher"
license=('GPL3')
depends=('electron4')
makedepends=('nodejs' 'npm' 'git' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('891ed92bd3a5d8ec8c2404909d6d88321f6f4f63495235e1a037af22b4f59247f77c3d66f94595f0278dc8ce34981da0ab4461ece407422f82b6b1b1addc4b64')

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