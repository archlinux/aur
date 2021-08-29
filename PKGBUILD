# Maintainer: Miodrag Tokić

pkgname=php-uopz
pkgver=7.1.0
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
    '6547efcdff7ade6d705d7606d9480493f8618194d046687d09db41a26610376b'
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
