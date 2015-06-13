# Maintainer: vmalloc support@cyborg-connect.de
pkgname=shttpd
pkgver=0.53
pkgrel=00
pkgdesc="Simple HTTP daemons: a framework for deploying single-purpose daemons running on separate addresses."
arch=('i686' 'x86_64')
url="http://www.superscript.com/shttpd/index.html"
license=('public domain')
depends=()
makedepends=()
source=("http://www.superscript.com/shttpd/$pkgname-$pkgver.tar.gz")

sha512sums=('35cbe2cd85a90c55c2ada2b13f75b8cf06f0123abfb4609271134c2d7deff99dc9752db37fb3ca1ae2b7131da53285c7a4f5a996edb37cebcdab912396c0b599')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	echo gcc -O2 -include /usr/include/errno.h > conf-cc || return 1
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	# install shttpd
	install -m 755 -D echo-httpd "$pkgdir/usr/bin/echo-httpd"
	install -m 755 -D echo-config "$pkgdir/usr/bin/echo-config"
	install -m 755 -D redir-httpd "$pkgdir/usr/bin/redir-httpd"
	install -m 755 -D redir-config "$pkgdir/usr/bin/redir-config"
	install -m 755 -D redir-data "$pkgdir/usr/bin/redir-data"
	install -m 755 -D cgi-httpd "$pkgdir/usr/bin/cgi-httpd"
	install -m 755 -D cgi-config "$pkgdir/usr/bin/cgi-config"
	install -m 755 -D cgiuser-httpd "$pkgdir/usr/bin/cgiuser-httpd"
	install -m 755 -D cgiuser-config "$pkgdir/usr/bin/cgiuser-config"
	install -m 755 -D cgi-dispatch "$pkgdir/usr/bin/cgi-dispatch"
	install -m 755 -D constant-httpd "$pkgdir/usr/bin/constant-httpd"
	install -m 755 -D constant-config "$pkgdir/usr/bin/constant-config"
}
