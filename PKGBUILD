# Maintainer: Samleybrize <stephen.berquet at gmail dot com>
pkgname=php-scrypt
pkgver=1.2
pkgrel=2
pkgdesc="A PHP wrapper to Colin Percival's Scrypt hashing function implementation"
url="http://pecl.php.net/package/scrypt"
arch=('x86_64' 'i686')
license=('BSD 2-Clause')
depends=('php')
backup=('etc/php/conf.d/scrypt.ini')

source=("http://pecl.php.net/get/scrypt-${pkgver}.tgz")

sha256sums=('b5089b32bdf5d4e1406081c29a7f72447ec801ef863cb7aefed22e82941f56f9')

build() {
  cd "$srcdir/scrypt-$pkgver"
  sed -e '25 d' config.m4 > config.m4.tmp && mv config.m4.tmp config.m4

  phpize
  ./configure --prefix=/usr --enable-scrypt
  make
}

package() {
  cd "$srcdir/scrypt-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=scrypt.so' > scrypt.ini 
  install -Dm644 scrypt.ini "$pkgdir/etc/php/conf.d/scrypt.ini"
}

