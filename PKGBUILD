# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com > (php-mongodb PKGBUILD)
# Contributor: Felix Yan <felixonmars@archlinux.org> (php-mongodb PKGBUILD)
# Contributor: Martin Striz < ms AT martinstriz DOT cz > (php-mongodb PKGBUILD)
# Contributor: Jarek Sedlacek <jareksedlacek@gmail.com> (php-mongodb PKGBUILD)
_projectname='mongodb'
_pkgname="php-$_projectname"
pkgname="${_pkgname}1"
pkgver='1.21.2'
pkgrel='1'
pkgdesc='MongoDB driver for PHP - 1.x version'
arch=('x86_64')
url="https://pecl.php.net/package/$_projectname"
license=('Apache-2.0')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=('php')
makedepends=('re2c')
backup=("etc/php/conf.d/$_projectname.ini")
source=(
	"$pkgname-$pkgver.tar.gz::https://pecl.php.net/get/$_projectname-$pkgver.tgz"
	"$_projectname.ini"
)
b2sums=('244ded20a1dd5958bd6b5b7038190be8178c774f96fab10a80bb5e9b8cb5416697b732baadf423007a9c828f5612a2f71e6f85f1669d4fec4905b42ea1c5cbe1'
        '24f0f8745143e0e5c87d811f27486520c515f6b3cdf903474d593b268bec31cfd8da68207575562ea55ada37a1db1c786c0fc4f8094b1964f4b2818cd81fe925')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	phpize
	./configure --prefix=/usr
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 "$srcdir/$_projectname.ini" "$pkgdir/etc/php/conf.d/$_projectname.ini"
}
