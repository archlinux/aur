# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: wolftankk <wolftankk@gmail.com>
pkgname=php-protobuf
pkgver=3.25.2
pkgrel=1
pkgdesc="Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data."
url="https://pecl.php.net/package/protobuf"
arch=('x86_64' 'i686')
license=('BSD-3-Clause')
depends=(
    'php'
    'protobuf'
)
backup=('etc/php/conf.d/protobuf.ini')

source=(
	"http://pecl.php.net/get/protobuf-${pkgver}.tgz"
)

sha256sums=('e5d65bc2c0d33cc35f47338fa12368aec05f1dff31e1f5b3895493280034c044')

build() {
  cd "$srcdir/protobuf-$pkgver/"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/protobuf-$pkgver/"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=protobuf.so' > protobuf.ini 
  install -Dm644 protobuf.ini "$pkgdir/etc/php/conf.d/protobuf.ini"
}
