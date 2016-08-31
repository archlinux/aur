# $Id: PKGBUILD 155874 2016-01-10 15:53:14Z arodseth $
# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>

pkgname=lib32-xmlrpc-c
pkgver=1.43.04
pkgrel=1
pkgdesc='XML-RPC for C and C++'
arch=('x86_64')
url='http://xmlrpc-c.sourceforge.net/'
license=('custom')
depends=('xmlrpc-c' 'lib32-gcc-libs' 'lib32-curl' 'lib32-xz')
makedepends=('gcc-multilib' 'libtool' 'subversion')
source=("svn://svn.code.sf.net/p/xmlrpc-c/code/stable")
sha1sums=('SKIP')

build() {
	cd stable

	export CC='gcc -m32'
	export CXX='g++ -m32'

	./configure --prefix=/usr \
		--libdir=/usr/lib32 \
		--mandir=/usr/share/man \
		--disable-cgi-server \
		--disable-libwww-client \
		--disable-wininet-client \
		--enable-abyss \
		--enable-cplusplus

	make
}

package() {
	cd stable

	make DESTDIR="$pkgdir" install
	install -Dm 644 doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -r "$pkgdir/usr/include"
	rm -r "$pkgdir/usr/bin"
	rm -r "$pkgdir/usr/share/man"
}
