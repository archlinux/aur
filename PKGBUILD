# Maintainer: Cameron Banta <cbanta@gmail.com>
# Contributor: Francesco Colista <francesco.colista@gmail.com>
pkgname=lua-pc
pkgver=1.0.0
pkgrel=2
pkgdesc="Lua Process Call"
license=('MIT/X11')
arch=('i686' 'x86_64')
url="https://github.com/LuaDist/lpc"
depends=('lua')
source=(https://github.com/LuaDist/lpc/tarball/$pkgver
	lpc-lua5.2-compat.patch)

build() {
	cd $srcdir
	ln -s $(find -name LuaDist-lpc-*) lpc
	cd "$srcdir/lpc"
    patch -Np1 -i ../../lpc-lua5.2-compat.patch
	make CFLAGS="$CFLAGS -fPIC" LDFLAGS="$LDFLAGS -shared"
}

package() {
	cd "$srcdir/lpc"
	make install DESTDIR="$pkgdir"
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

md5sums=('d25afbbb5feaf6d966306e80dfef11fd'
         '97c3a94797b03b84c6340781b413e5be')

