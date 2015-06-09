# Maintainer: piernov <piernov@piernov.org

pkgname=lua51-pam
pkgver=r27.20728f8
pkgrel=1
pkgdesc='Lua module for PAM authentication'
arch=('i686' 'x86_64')
url='https://github.com/devurandom/lua-pam'
depends=('pam' 'lua51')
makedepends=('git')
source=("lua-pam::git+git://github.com/devurandom/lua-pam.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/lua-pam"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/lua-pam"
	git submodule update --init
	make LUA_VERSION=5.1
}

package() {
	cd "${srcdir}/lua-pam"
	install -D pam.so "$pkgdir/usr/lib/lua/5.1/pam.so"
}
