# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=php-translit
pkgver=0.6.2
pkgrel=1
pkgdesc="Transliterates non-latin character sets to latin"
url="http://pecl.php.net/package/translit"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/translit.ini')
pkgver_url=`echo ${pkgver} | sed s/\\\\./_/g`

source=(
    "https://github.com/derickr/pecl-translit/archive/RELEASE_$pkgver_url.tar.gz"
)

sha256sums=('863ba3793d09776c309ae1a46af2826f8acf855db10ba8d976716ec6ab2ea3a5')

build() {
    cd "$srcdir/pecl-translit-RELEASE_$pkgver_url"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
    cd "$srcdir/pecl-translit-RELEASE_$pkgver_url"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=translit.so' > translit.ini
  install -Dm644 translit.ini "$pkgdir/etc/php/conf.d/translit.ini"
}
