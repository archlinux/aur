# Maintainer: vmalloc vmalloc@cyborg-connect.de
pkgname=qtools
pkgver=0.56
pkgrel=00
pkgdesc="The qtools package contains utilities for use with qmail, typically as part of .qmail command processing"
arch=('i686' 'x86_64')
url="http://www.superscript.com/qtools"
license=('GPL')
depends=()
makedepends=()
source=("http://www.superscript.com/qtools/$pkgname-$pkgver.tar.gz"
'qtools-0.56-errno.patch')

sha512sums=('2016ca4f77fc370f6caac56f447325461018dff1f8a61fad305744578f0c26f0495c26d6cba6a8a9d5c86c6ef86635edd69705e9af88f70477a3f6ed121e6085'
            'ca8fc0fc14724a1dfc9931e24071f0b72ba8bdc3c13c3dc84a597b73e92541043526a288ceb2e260dfb8ab8ce4f970b6505b323458817e499188cc4c6680ba22')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	patch -p1 < ../qtools-0.56-errno.patch || return 1
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	# install qtools
	install -m 755 -D 822addr "$pkgdir/usr/bin/822addr"
	install -m 755 -D 822body "$pkgdir/usr/bin/822body"
	install -m 755 -D 822bodyfilter "$pkgdir/usr/bin/822bodyfilter"
	install -m 755 -D 822fields "$pkgdir/usr/bin/822fields"
	install -m 755 -D 822headerfilter "$pkgdir/usr/bin/822headerfilter"
	install -m 755 -D 822headerok "$pkgdir/usr/bin/822headerok"
	install -m 755 -D 822headers "$pkgdir/usr/bin/822headers"
	install -m 755 -D checkaddr "$pkgdir/usr/bin/checkaddr"
	install -m 755 -D checkdomain "$pkgdir/usr/bin/checkdomain"
	install -m 755 -D ifaddr "$pkgdir/usr/bin/ifaddr"
	install -m 755 -D iftoccfrom "$pkgdir/usr/bin/iftoccfrom"
	install -m 755 -D condtomaildir "$pkgdir/usr/bin/condtomaildir"
	install -m 755 -D tomaildir "$pkgdir/usr/bin/tomaildir"
	install -m 755 -D filterto "$pkgdir/usr/bin/filterto"
	install -m 755 -D replier "$pkgdir/usr/bin/replier"
	install -m 755 -D replier-config "$pkgdir/usr/bin/replier-config" 
}
