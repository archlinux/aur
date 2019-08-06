# Maintainer: Souper <me at supertransformer dot se>
pkgname=soup-launcher
pkgver=0.1.1
pkgrel=1
_srcname="SoupLauncher-$pkgver"
pkgdesc='Soup Launcher is a custom Minecraft launcher specifically designed for Modded Minecraft.'
arch=('x86_64')
url="https://github.com/supertransformer/SoupLauncher"
license=('GPL3')
depends=('electron4')
makedepends=('nodejs' 'npm' 'git' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1e7f439739f8b69c9fef623e307988169ffbf3eeffbfd23cbbf1843a5fb6f157ad20f48ffc07777611e23a324161d1eb967537e24611b3cd8350ac48be51714d')

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