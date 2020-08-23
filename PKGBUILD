# Maintainer: Katie Wolfe <katie@dnaf.moe>

_lua_version=5.4

pkgname=fennel-git
pkgver=r1047.beafb1e
pkgrel=1
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
groups=()
depends=('lua')
makedepends=('git' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://git.sr.ht/~technomancy/fennel')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/fennel"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/fennel"
	make fennel fennel.lua fennelview.lua
}

package() {
	cd "${srcdir}/fennel"

	install -Dm644 "fennel.lua" "fennelview.lua" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
