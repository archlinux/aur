# Maintainer: Katie Wolfe <wolfe@katie.host>

_lua_version=5.4

pkgname=fennel
_pkgver=0.5.0
pkgver=0.5.0
pkgrel=1
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
depends=('lua')
makedepends=('make')
provides=(fennel)
conflicts=(fennel)
source=("fennel-${_pkgver}.tar.gz::https://git.sr.ht/~technomancy/fennel/archive/${_pkgver}.tar.gz")
sha512sums=('6bf22c46aa34baaba5684f66f9e4307c2beb21c89a8a91f9bf9ac9a3d29c73e1bfe1acbf6bfd94546a3268be62fa65bef1e1e2dd3cf2d5ae9d7bf90574bf9c69')

build() {
	cd "$srcdir/Fennel-${_pkgver}"
	make fennel fennel.lua fennelview.lua
}

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.lua" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
