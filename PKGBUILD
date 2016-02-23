# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-ds-git
pkgver=r2.656c64b
pkgrel=1
pkgdesc='Data structures for PHP 7.'
url='https://github.com/php-ds/extension'
license=('MIT')
arch=('any')
depends=('php')
makedepends=('git' 'php')
provides=('php-ds')
conflicts=('php-ds')
replaces=('php-ds')
backup=('etc/php/conf.d/ds.ini')
source=('git+https://github.com/php-ds/extension.git'
        'ds.ini')
md5sums=('SKIP'
         'a50c990f8285a21242caa1a955a35707')

pkgver() {
  cd $srcdir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/extension
  phpize
  ./configure
  make
}

package() {
  install -Dm744 $srcdir/extension/modules/ds.so $pkgdir/usr/lib/php/modules/ds.so
  install -Dm644 ds.ini $pkgdir/etc/php/conf.d/ds.ini
}

# vim:set ts=2 sw=2 et:
