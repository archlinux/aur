# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=blender-plugin-vectex
pkgver=0.9
pkgrel=3
pkgdesc="Vectex is a SVG vector texture plugin for Blender"
url="http://code.google.com/p/vectex/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('blender')
makedepends=()
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/vectex/vectex-${pkgver}-fix.tar.bz2" '64bit.patch')
sha256sums=('6da59482f658f35fb676eb632d1653b6038d8b57ef3121c47e6446805fa15750'
	    '2e9f86abb9125ccc6d9f41f8751a7eefc32a1183b69bc7868ddb4c5c9820d11f')

build() {
	cd "$srcdir/vectex-$pkgver"

	if [ "${CARCH}" == "x86_64" ]; then
		patch -p0 < $startdir/src/64bit.patch
	fi

	msg "Starting build process."
	MAKEFLAGS= make || return 1
}

package() {
	cd "$srcdir/vectex-$pkgver"
	install -D -m755 vectex.so "$pkgdir/usr/share/blender/plugins/texture/vectex.so"
}

