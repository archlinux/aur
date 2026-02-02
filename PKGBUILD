# Contributor: Chris Brannon <cmbrannon79 (at) gmail.com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=edbrowse-git
pkgver=3.8.15.r328.g1898d890
pkgrel=1
pkgdesc='A line-oriented editor, browser and mail client.'
arch=('i686' 'x86_64')
url='http://edbrowse.org/'
license=('GPL-2' 'MIT' 'OpenSSL' 'CC0-1.0' 'curl')
depends=('openssl' 'pcre2' 'curl>=7.29.0' 'unixodbc' 'quickjs-ng')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/CMB/edbrowse")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname/src"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -D -m644 ../doc/man-edbrowse-debian.1 $pkgdir/usr/share/man/man1/edbrowse.1
	install -D -m644 ../doc/usersguide.html $pkgdir/usr/share/doc/${pkgname%-*}/userguide.html
	install -D -m644 ../lang/ebrc-en $pkgdir/usr/share/doc/${pkgname%-*}/sample.ebrc
	install -D -m644 ../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
