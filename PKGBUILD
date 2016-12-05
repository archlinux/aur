# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=lua-magic
pkgname=('lua-magic' 'lua51-magic' 'lua52-magic')
pkgver=5.25
pkgrel=1
pkgdesc='libmagic binding for lua'
arch=('i686' 'x86_64')
url='https://github.com/mah0x211/lua-magic'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/mah0x211/${pkgbase}/archive/v${pkgver}.tar.gz")
sha256sums=('98af5e79246811ddde8ba50d5b43cd4dd854f84018081aac5e25e85288565697')

build() {
	cd lua-magic-${pkgver}/

	echo '#define DEFAULT_LUA_MAGIC_FILE "/usr/share/file/misc/magic.mgc"' > src/config.h

	gcc -fPIC -shared -I/usr/include/lua5.1/ -llua5.1 -lmagic -o magic51.so src/magic.c
	gcc -fPIC -shared -I/usr/include/lua5.2/ -llua5.2 -lmagic -o magic52.so src/magic.c
	gcc -fPIC -shared -llua -lmagic -o magic53.so src/magic.c
}

package_lua-magic() {
	depends=('file' 'lua')

	install -D -m0755 lua-magic-${pkgver}/magic53.so ${pkgdir}/usr/lib/lua/5.3/magic.so
}

package_lua51-magic() {
	depends=('file' 'lua51')

	install -D -m0755 lua-magic-${pkgver}/magic51.so ${pkgdir}/usr/lib/lua/5.1/magic.so
}

package_lua52-magic() {
	depends=('file' 'lua51')

	install -D -m0755 lua-magic-${pkgver}/magic52.so ${pkgdir}/usr/lib/lua/5.2/magic.so
}

