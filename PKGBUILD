# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minetest-minecraftnt-git
pkgver=100.b07d8e4
pkgrel=1
pkgdesc='An attempt to recreate Minecraft inf-20100630-2, retroactively referred to as Alpha 1.0.0, in Minetest.'
arch=('any')
url="https://github.com/minecraftnt-minetest/minecraftnt"
license=('custom')
depends=()
makedepends=('git' 'python' 'python-requests')
source=("minecraftnt::git+https://github.com/minecraftnt-minetest/minecraftnt")
md5sums=('SKIP')
options=(!strip)

pkgver() {
	cd "${srcdir}/minecraftnt"
	echo $(git rev-list --count main).$(git rev-parse --short main)
}

build() {
	cd "${srcdir}/minecraftnt"
	python fetchassets.py
}

package() {
	local mcnt_dir="${pkgdir}/usr/share/minetest/games/minecraftnt"

	cd "${srcdir}/minecraftnt"
	mkdir -p "${mcnt_dir}"
	cp -r * "${mcnt_dir}"
}
