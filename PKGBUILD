# Maintainer: Rodrigo Lourenço <rzl@rzl.ooo>
_pecl=krb5
pkgname=php-pecl-${_pecl}
pkgver=1.1.3
pkgrel=1
pkgdesc="PHP interface for Kerberos and GSSAPI"
arch=(x86_64)
url="https://pecl.php.net/package/${_pecl}"
license=('MIT')
depends=(php)
source=("https://pecl.php.net/get/${_pecl}-${pkgver}.tgz")
md5sums=('c99aa6db1826310fe91a0f9890c8d185')

prepare() {
	cd "$_pecl-$pkgver"
}

build() {
	cd "$_pecl-$pkgver"
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pecl-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
	mkdir -p "$pkgdir/etc/php/conf.d"
	printf "; extension=${_pecl}\n" > "$pkgdir/etc/php/conf.d/${_pecl}.ini"
}
