# Maintainer: kraftwerk28 <kefirchik3@gmail.com>

_pkgname=lua-i3ipc
pkgname="${_pkgname}-git"
pkgver=r44.0c140ca
pkgrel=1
pkgdesc="A lua library for controlling i3wm & Sway"
arch=('any')
url="https://github.com/kraftwerk28/${_pkgname}.git"
license=('MIT')
depends=('luajit' 'lua51-luv' 'lua51-cjson')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/kraftwerk28/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	local lua_version=5.1
	local module_name=i3ipc
	local module_dir="/usr/share/lua/$lua_version"
	mkdir -p "$pkgdir/$module_dir/$module_name"
	cd "$srcdir/$_pkgname"
	cp -R "$module_name" "$pkgdir/$module_dir"
}
