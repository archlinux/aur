# Maintainer: Souper <me at supertransformer dot se>
pkgname=soup-launcher
pkgver=0.1.11
pkgrel=1
_srcname="SoupLauncher-$pkgver"
pkgdesc='Soup Launcher is a custom Minecraft launcher specifically designed for Modded Minecraft.'
arch=('x86_64')
url="https://github.com/supertransformer/SoupLauncher"
license=('GPL3')
depends=('electron')
makedepends=('nodejs' 'npm' 'git' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('3de3bda7a3384ab5623aa2e6c72f5ecbeea029dba7e9e14deceec5ae352f95a8d5949e7a931357a531ac7f3a30d48bda3fc05cd8807e5247e8b96dced6dac020')

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