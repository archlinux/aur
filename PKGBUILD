# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=blender-plugin-vectex
pkgver=0.9
pkgrel=2
pkgdesc="Vectex is a SVG vector texture plugin for Blender"
url="http://code.google.com/p/vectex/"
license="GPL"
arch=('i686' 'x86_64')
depends=('blender')
makedepends=()
source=("http://vectex.googlecode.com/files/vectex-${pkgver}-fix.tar.bz2" '64bit.patch')
md5sums=('e36937018056f072f35a8df3bb7574ad' '98ddd03b81bff9b2f923e8fd5e449b1b')

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

