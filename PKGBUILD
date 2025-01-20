# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
_pkgname=brux-gdk
pkgname=brux-gdk
pkgver=0.2.11
pkgrel=3
pkgdesc="A free runtime and development kit using SDL and Squirrel"

arch=(any)

url="https://github.com/KelvinShadewing/brux-gdk"
license=('AGPL-3.0-only')

depends=(
	'sdl2'
	'sdl2_gfx'
	'sdl2_image'
	'sdl2_net'
	'squirrel'
)

makedepends=(
	'base-devel'
	'git'
	'cmake'
)

provides=("brux-gdk")
conflicts=("brux-gdk")

source=("$_pkgname.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz" "systemsquirrel.patch")
sha256sums=('a9dc3ea6fc1ac3e91556cb57fab69355ec51f006920a5d6229312b98ea68dfd3' 'SKIP')

prepare() {
	cd "$_pkgname-$pkgver/"

	ls -l rte/main.h

	patch -p0 < "$srcdir/systemsquirrel.patch"
}

build() {
	cd "$_pkgname-$pkgver/rte"

	make linux
}

package() {
	install -Dm755 "$_pkgname-$pkgver/rte/bin/brux" "$pkgdir/usr/bin/brux"
}
