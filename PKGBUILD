# Maintainer: Miodrag Tokić

pkgname=php-uopz
pkgver=7.0.0
pkgrel=1
pkgdesc='User Operations for Zend'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/uopz'
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/uopz.ini')

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/krakjoe/uopz/archive/v$pkgver.tar.gz"
    "uopz.ini"
)
sha256sums=(
    'd9f7f865f43253f1a9b9d99a391ba73108d387407ae5b683a3cd95b1cca0f54b'
    '43af71e84787144f44859f9cf7a13531aea57c8371db5ec95b871bc0bf9772d8'
)

build() {
    cd "$srcdir/uopz-$pkgver"

    phpize
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/uopz-$pkgver"

    make test
}

package() {
    cd "$srcdir/uopz-$pkgver"

    make INSTALL_ROOT="$pkgdir" install
    install -D -m 644 "$srcdir/uopz.ini" "$pkgdir/etc/php/conf.d/uopz.ini"
}
