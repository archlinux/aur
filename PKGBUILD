# Maintainer: Souper <me at supertransformer dot se>
pkgname=soup-launcher
pkgver=0.1.8
pkgrel=1
_srcname="SoupLauncher-$pkgver"
pkgdesc='Soup Launcher is a custom Minecraft launcher specifically designed for Modded Minecraft.'
arch=('x86_64')
url="https://github.com/supertransformer/SoupLauncher"
license=('GPL3')
depends=('electron')
makedepends=('nodejs' 'npm' 'git' 'unzip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9fbec99eb72fbf8a9af7ae7eb604ae11008d44c141be29c41c12603244cfd1a4ce04d13bd984ffe0f651f9d7fa340a8f98ac7d84210e34916a5e59f8b4f28054')

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