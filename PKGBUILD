# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
pkgname=brux-gdk
pkgver=0.2.11
pkgrel=4
pkgdesc="A free runtime and development kit using SDL and Squirrel"

arch=('x86_64' 'riscv64' 'aarch64' 'i686' 'riscv32' 'armv7h')

url="https://github.com/KelvinShadewing/brux-gdk"
license=('AGPL-3.0-only')

depends=(
	'sdl2'
	'sdl2_gfx'
	'sdl2_image'
	'sdl2_mixer'
	'sdl2_net'
	'squirrel'
)

# Make depends removed. Will be re-added if brux maintains a non-make build system by its next stable release

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz" "systemsquirrel.patch" "makefix.patch")
sha256sums=('a9dc3ea6fc1ac3e91556cb57fab69355ec51f006920a5d6229312b98ea68dfd3' 'SKIP' 'SKIP')

prepare() {
	cd "$pkgname-$pkgver/"

	patch -p0 < "$srcdir/systemsquirrel.patch"
	patch -p0 < "$srcdir/makefix.patch"
}

build() {
	cd "$pkgname-$pkgver/rte"

	make linux
}

package() {
	install -Dm755 "$pkgname-$pkgver/rte/bin/brux" "$pkgdir/usr/bin/brux"
}
