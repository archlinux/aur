# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: wolftankk <wolftankk@gmail.com>
pkgname=php-protobuf
pkgver=5.34.0
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
	"https://pecl.php.net/get/protobuf-${pkgver}.tgz"
)

sha256sums=('f04a373ac7826111b868a172dce17e4b94f09ad72bc3466351a36feb69be6e70')

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
