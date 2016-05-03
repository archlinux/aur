# Maintainer: Miodrag Tokić

pkgname=php-uopz
pkgver=5.0.1
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
    '0c8f8d0e8a1bb5331677a4e51d8288997f967224385d7110c2b18c4f31e7e86d'
    'daa9e17d726dfced8aa215950628040ebad7f0faf2c9a41e70c6f3d7a8d6e82d'
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
