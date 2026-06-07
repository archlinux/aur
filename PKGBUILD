# Maintainer: Fermín Olaiz <fermin@olaiz.net>
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: wolftankk <wolftankk@gmail.com>
pkgname=php-protobuf
pkgver=5.34.2
pkgrel=1
pkgdesc="Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data."
url="https://pecl.php.net/package/protobuf"
arch=('x86_64' 'i686')
license=('BSD-3-Clause')
depends=(
    'glibc'
    'php'
    'protobuf'
)
backup=('etc/php/conf.d/protobuf.ini')

source=(
	"https://pecl.php.net/get/protobuf-${pkgver}.tgz"
)

sha256sums=('bae8008d01022c1aab8db30b76031c9c65e211b99f3b32a60687e11230f07a61')

build() {
  cd "$srcdir/protobuf-$pkgver/"

  phpize
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/protobuf-$pkgver/"

  make test
}
package() {
  cd "$srcdir/protobuf-$pkgver/"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=protobuf.so' > protobuf.ini 
  install -Dm644 protobuf.ini "$pkgdir/etc/php/conf.d/protobuf.ini"
}
