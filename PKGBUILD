# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-translit
pkgver=0.6.1
pkgrel=2
pkgdesc="Transliterates non-latin character sets to latin"
url="http://pecl.php.net/package/translit"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/translit.ini')

source=(
    http://pecl.php.net/get/translit-${pkgver}.tgz
)

sha256sums=(
    864faa76ef249e0203b761fd6a0b93ad5f61d1c1f4893dc0637997772bf671e3
)

build() {
  cd "$srcdir/translit-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/translit-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=translit.so' > translit.ini
  install -Dm644 translit.ini "$pkgdir/etc/php/conf.d/translit.ini"
}
