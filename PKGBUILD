# Maintainer: Miodrag Tokić

pkgname=php-uopz
pkgver=5.0.2
pkgrel=1
pkgdesc='User Operations for Zend'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/uopz'
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/uopz.ini')

source=(
    "https://pecl.php.net/get/uopz-$pkgver.tgz"
    "uopz.ini"
)
sha256sums=(
    '74bfb68c7f88013be6374862eed41b616e0bd6aa522142ccf3394470d487d5c9'
    '43af71e84787144f44859f9cf7a13531aea57c8371db5ec95b871bc0bf9772d8'
)

build() {
    cd "$srcdir/uopz-${pkgver}"

    phpize
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/uopz-${pkgver}"

    make test
}

package() {
    cd "$srcdir/uopz-${pkgver}"

    make INSTALL_ROOT="$pkgdir" install
    install -D -m 644 "$srcdir/uopz.ini" "$pkgdir/etc/php/conf.d/uopz.ini"
}
