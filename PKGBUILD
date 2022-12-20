# Maintainer: Iliya Ivanov <aur@proforge.org>

_pkgname=xdebug
pkgname=${_pkgname}-zts
pkgver=3.2.0
pkgrel=1

pkgdesc="PHP debugging extension (for ZTS enabled PHP)"
arch=('x86_64')
url="https://www.xdebug.org"
license=('GPL')
depends=('php-zts')
backup=('etc/php/conf.d/xdebug.ini')
source=("https://xdebug.org/files/${_pkgname}-${pkgver/rc/RC}.tgz"
	'xdebug.ini')
sha256sums=('7769b20eecdadf5fbe9f582512c10b394fb575b6f7a8c3a3a82db6883e0032b7'
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
