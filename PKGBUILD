# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: wolftankk <wolftankk@gmail.com>
pkgname=php-protobuf
pkgver=4.28.3
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

sha256sums=('b84e3290f406a0418a6b8ec1118db5e37f97f2e3bd251c2c3a885d0cbba31a58')

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
