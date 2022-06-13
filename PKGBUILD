# Maintainer: Iliya Ivanov <aur@proforge.org>

_pkgname=xdebug
pkgname=${_pkgname}-zts
pkgver=3.1.4
pkgrel=1

pkgdesc="PHP debugging extension (for ZTS enabled PHP)"
arch=('x86_64')
url="https://www.xdebug.org"
license=('GPL')
depends=('php-zts')
backup=('etc/php/conf.d/xdebug.ini')
source=("https://xdebug.org/files/${_pkgname}-${pkgver/rc/RC}.tgz"
	'xdebug.ini')
sha256sums=('4195926f9f6c4e802ff749bb2ca85ac50636719a72e5389e372e35ef523505f9'
            'b7c8de3c7b5621a73175fb63d6cbc7d535f92cefea013a7a872b9239d691f68e')

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  phpize
  ./configure --prefix=/usr --enable-xdebug
  make
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  make INSTALL_ROOT="$pkgdir" install
  install -D -m 644 "$srcdir"/xdebug.ini "$pkgdir"/etc/php/conf.d/xdebug.ini
}
