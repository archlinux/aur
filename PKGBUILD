# Maintainer: Dwayne Bent <dbb.1@liqd.org>

pkgbase=lua-crypto
pkgname=('lua-crypto' 'lua51-crypto' 'lua52-crypto' 'lua53-crypto')
pkgver=0.3.2
pkgrel=7
pkgdesc='Lua frontend to the OpenSSL cryptographic library'
arch=('i686' 'x86_64')
url='http://mkottman.github.io/luacrypto/'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52' 'lua53' 'openssl-1.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mkottman/${pkgname/-/}/archive/${pkgver}.tar.gz")
sha256sums=('63c5d7e2539779039114335b9a8f149d63382c4db298d69e70488a0108143bb4')

build() {
	cd luacrypto-${pkgver}/

	gcc -fPIC -shared -I/usr/include/lua5.1/ -I/usr/include/openssl-1.0/ -L/usr/lib/openssl-1.0/ -llua5.1 -lssl -lcrypto -o crypto51.so src/lcrypto.c
	gcc -fPIC -shared -I/usr/include/lua5.2/ -I/usr/include/openssl-1.0/ -L/usr/lib/openssl-1.0/ -llua5.2 -lssl -lcrypto -o crypto52.so src/lcrypto.c
	gcc -fPIC -shared -I/usr/include/lua5.3/ -I/usr/include/openssl-1.0/ -L/usr/lib/openssl-1.0/ -llua5.3 -lssl -lcrypto -o crypto53.so src/lcrypto.c
	gcc -fPIC -shared -I/usr/include/openssl-1.0/ -L/usr/lib/openssl-1.0/ -llua -lssl -lcrypto -o crypto54.so src/lcrypto.c
}

package_lua-crypto() {
	depends=('openssl-1.0' 'lua')

	install -D -m0755 luacrypto-${pkgver}/crypto54.so ${pkgdir}/usr/lib/lua/5.4/crypto.so
}

package_lua51-crypto() {
	depends=('openssl-1.0' 'lua51')

	install -D -m0755 luacrypto-${pkgver}/crypto51.so ${pkgdir}/usr/lib/lua/5.1/crypto.so
}

package_lua52-crypto() {
	depends=('openssl-1.0' 'lua52')

	install -D -m0755 luacrypto-${pkgver}/crypto52.so ${pkgdir}/usr/lib/lua/5.2/crypto.so
}

package_lua53-crypto() {
	depends=('openssl-1.0' 'lua53')

	install -D -m0755 luacrypto-${pkgver}/crypto53.so ${pkgdir}/usr/lib/lua/5.3/crypto.so
}

