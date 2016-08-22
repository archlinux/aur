#  Maintainer: Sinnamon (George Aladin) <AngleSi at yahoo dot com>

pkgname=lua51-ex
_pkgname=lua-ex
pkgver=2.07.2009
pkgrel=1
pkgdesc="ExtensionProposal is an API and implementation for additional non-ANSI functions in the os and io namespaces."
arch=('i686' 'x86_64')
license=('MIT')
url="http://lua-users.org/wiki/ExtensionProposal"
depends=('lua51')

source=('https://github.com/luaforge/lua-ex/archive/master.zip')

md5sums=('730831f88d3dea4fcddadd81f2c6cb90')

prepare() {
	cd ${_pkgname}-master
	##
        echo "LUAINC= -I/usr/include/lua5.1/" > conf
        echo "LUALIB= -L/usr/lib/ -llua5.1" >> conf
        echo "POSIX_SPAWN= -DMISSING_POSIX_SPAWN" >> conf
        echo "EXTRA= posix_spawn.o" >> conf
	##
        sed -i 's/$(INCLUDES)/$(INCLUDES) -fPIC/g' posix/Makefile
}

build() {
	cd ${_pkgname}-master
	make linux || return 1
}

package() {
        cd ${_pkgname}-master/posix/
	install -D ex.so ${pkgdir}/usr/lib/lua/5.1/ex.so
}
