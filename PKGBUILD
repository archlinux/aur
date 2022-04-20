# Maintainer: kraftwerk28 <kefirchik3@gmail.com>

pkgname=lua-i3ipc-git
_pkgname="${pkgname%-git}"
pkgver=v1.3.r0.gb5f0328
pkgrel=1
pkgdesc="A lua library for controlling i3wm & Sway"
arch=('any')
url="https://github.com/kraftwerk28/lua-i3ipc.git"
license=('MIT')
depends=('luajit')
makedepends=('git' 'luarocks' 'tree')
optdepends=('socat')
source=("git+https://github.com/kraftwerk28/lua-i3ipc.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	local luaver=5.1
	cd ${srcdir}/${_pkgname}
	luarocks \
		--lua-version "$luaver" \
		--tree "${pkgdir}/usr/share/lua/5.1/i3ipc/_rocks" \
		make --no-manifest \
		${srcdir}/${_pkgname}/*.rockspec
	local dir=${pkgdir}/usr/share/lua/$luaver/
	mkdir -p ${dir}
	cd ${dir}
	cp -R ${srcdir}/${_pkgname}/i3ipc/ .
}
