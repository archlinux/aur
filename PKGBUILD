# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssl-admin
pkgver=1.2.1
_MAJVER=1
_MINVER=2
_REVISION=1
pkgrel=1
pkgdesc="OpenSSL certificate manager with OpenVPN support"
arch=('any')
url="https://www.secure-computing.net"
license=('GPL')
depends=('perl')
source=(
# perl
"https://www.secure-computing.net/trac/export/HEAD/SCN%20Open%20Source/trunk/ssl-admin/perl/configure"
"https://www.secure-computing.net/trac/export/HEAD/SCN%20Open%20Source/trunk/ssl-admin/perl/Makefile"
"https://www.secure-computing.net/trac/export/HEAD/SCN%20Open%20Source/trunk/ssl-admin/perl/openssl.conf"
"https://www.secure-computing.net/trac/export/HEAD/SCN%20Open%20Source/trunk/ssl-admin/perl/ssl-admin"
"https://www.secure-computing.net/trac/export/HEAD/SCN%20Open%20Source/trunk/ssl-admin/perl/ssl-admin.conf"
# man pages
"https://www.secure-computing.net/trac/export/HEAD/SCN%20Open%20Source/trunk/ssl-admin/perl/man1/ssl-admin.1"
"https://www.secure-computing.net/trac/export/HEAD/SCN%20Open%20Source/trunk/ssl-admin/perl/man5/ssl-admin.conf.5"
)

sha256sums=('8a337c1e505fab65eb6115137aa6e10c2b757748ea46d9a60bfda891ef523684'
            'cec2959e21e3ef6bd836cc2e55941b6f080ae7be8a738ff79e158ec31fecf72f'
            'aaa1fb579aa6297fabc53ace12c188315f58e08ef6ba5c06213a6810112fc83a'
            '17fa5f8cb75e5bea2c087512ffbc6ee84ed6a3e13f291a1682e86658d75cfc76'
            'db6d991dd3e3468e3834c21276fba51bfc87eadb2913b869bf1ed293cb04b0d1'
            '0bc537e4c0ec21cfe8083191ed68a84b53729d278ebdca4db2ec7a740c0f446e'
            '18e305019a88fe16d93a3772e15c783638a439f41900f33bed8fe58b5699cc79')

build() {
	# until I can find an upstream tarball
	# need to prep the source dirtree as configure and Makefile expect it
	mkdir man1 man5
	cp ssl-admin.1 man1
	cp ssl-admin.conf.5 man5
	chmod +x configure
	
	# need to set version string
	sed -i -e "s/~~~VERSION~~~/$_MAJVER.$_MINVER.$_REVISION/" ssl-admin
	sed -i -e "s/~~~VERSION~~~/$_MAJVER.$_MINVER.$_REVISION/" man1/ssl-admin.1
	sed -i -e "s/~~~VERSION~~~/$_MAJVER.$_MINVER.$_REVISION/" man5/ssl-admin.conf.5
	./configure --prefix=/usr
}

package() {
	mkdir -p "$pkgdir/etc/ssl-admin"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	mkdir -p "$pkgdir/usr/share/man/man5"
	make DESTDIR="$pkgdir/" install
}
