# Maintainer: Samleybrize <stephen.berquet at gmail dot com>
pkgname=php-ncurses
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal screen handling and optimization package"
url="http://pecl.php.net/package/ncurses"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php' 'ncurses')
backup=('etc/php/conf.d/ncurses.ini')

source=("http://pecl.php.net/get/ncurses-${pkgver}.tgz")

sha256sums=('7fa4998d06a00a094276e5283fd6a408cbf78cd2d3b889fe6ab51be3780c9063')

build() {
  cd "$srcdir/ncurses-$pkgver"

  phpize
  ./configure --prefix=/usr --with-ncurses
  make
}

package() {
  cd "$srcdir/ncurses-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=ncurses.so' > ncurses.ini 
  install -Dm644 ncurses.ini "$pkgdir/etc/php/conf.d/ncurses.ini"
}
