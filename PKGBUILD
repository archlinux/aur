# Maintainer: Katie Wolfe <wolfe@katie.host>

_lua_version=5.3

pkgname=fennel
_pkgver='0.4.2'
pkgver=0.4.2
pkgrel=1
pkgdesc="A Lua Lisp language"
arch=('x86_64')
url="https://github.com/bakpakin/Fennel"
license=('MIT')
depends=('lua')
makedepends=('make')
provides=(fennel)
conflicts=(fennel)
source=("fennel-${_pkgver}.tar.gz::https://github.com/bakpakin/Fennel/archive/${_pkgver}.tar.gz")
sha512sums=('60cf0deb256c19d84662c9a42c39aa6ef7bc7033cc9acb96287572402cb06c500af6a9b5f600d75a74d54c0600b6adcb59a9f5f5973c598bf5e8ebbaf4dee872')

build() {
	cd "$srcdir/Fennel-${_pkgver}"
	make fennel fennel.lua fennelview.lua fennelfriend.lua
}

package() {
	cd "$srcdir/Fennel-${_pkgver}"

	install -Dm644 "fennel.lua" "fennelview.lua" "fennelfriend.lua" \
		-t "${pkgdir}/usr/lib/lua/${_lua_version}"
	install -Dm755 "fennel" \
		"${pkgdir}/usr/bin/fennel"
}
