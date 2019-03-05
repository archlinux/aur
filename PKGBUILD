# Maintainer: Tyler Witten <turtlewit@live.com>
pkgname=sprytile
pkgver=0.4.50
pkgrel=1
pkgdesc="A blender addon for creating tile based low spec 3D scenes."
arch=('x86_64')
url="https://github.com/Sprytile/Sprytile"
license=('MIT')
depends=('blender')
source=("https://github.com/Sprytile/Sprytile/archive/v0.4.50.tar.gz")
md5sums=('84c88b493f52ee04034d594241b60db1')

prepare() {
	cd "Sprytile-$pkgver"
	echo "Disabling addon updater..."
	echo "The addon will throw harmless errors about the updater;"
	echo "However, the it should otherwise function normally."
	sed -i 's/addon_updater_ops.register(bl_info)/#addon_updater_ops.register(bl_info)/' __init__.py
}

package() {
	cd "Sprytile-$pkgver"
	addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
	install -dm755 "${addons}/SpryTile"
	cp -r ./ "${addons}/SpryTile/"
}
