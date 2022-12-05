# Maintainer: Otreblan <otreblain@gmail.com>

pkgname='blender-plugin-geometry-script'
pkgver='0.1.2'
pkgrel=1
pkgdesc="A scripting API for Blender's Geometry Nodes "
arch=('any')
url="https://github.com/carson-katri/geometry-script"
license=('GPL')
depends=('blender')
makedepends=()
provides=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('7a4b1470113244d63595ecb1022f84d59c2116f2197fd2d3947aaa31779e18d5')

package() {

	_version=$(blender --version | sed -E -n -e 's/.*([0-9]+\.[0-9]+)\.[0-9]+.*/\1/p')

	_addons="$pkgdir/usr/share/blender/$_version/scripts/addons/${pkgname#blender-plugin-}"

	cd "$srcdir/${pkgname#blender-plugin-}-$pkgver"

	if [ ! -d "$_addons" ]; then
		mkdir -p "$_addons"
	fi

	for i in *; do
		cp -r "$i" "$_addons"
	done
}
