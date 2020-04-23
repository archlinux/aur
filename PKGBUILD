# Maintainer: Souper <me at souper dot dev>
pkgname=soup-launcher-v2-git
pkgver=0.1.15
pkgrel=1
_srcname="SoupLauncher-$pkgver"
pkgdesc='Soup Launcher is a custom Minecraft launcher specifically designed for Modded Minecraft. Another attempt at making a Minecraft Launcher.'
arch=('x86_64')
url="https://github.com/SSouper/SoupLauncherV2"
license=('Apache-2.0')
makedepends=('nodejs' 'npm' 'git' 'unzip')
depends=('libxss')
source=("$pkgname::git+https://github.com/SSouper/SoupLauncherV2.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	npm install
}

build() {
	cd "$pkgname"
	mkdir -p "release-builds"
	npm run package-linux
}

package() {
	cd "$pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	install -Dm644 "assets/icons/png/16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
	install -Dm644 "assets/icons/png/24x24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/$pkgname.png"
	install -Dm644 "assets/icons/png/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
	install -Dm644 "assets/icons/png/48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
	install -Dm644 "assets/icons/png/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
	install -Dm644 "assets/icons/png/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	install -Dm644 "assets/icons/png/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	install -Dm644 "assets/icons/png/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

	cd release-builds/soup-launcher-linux-x64
	find . -type f -exec install -Dm 755 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
