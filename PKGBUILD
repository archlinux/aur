# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=php-maxminddb
pkgver=1.10.0
pkgrel=1
pkgdesc="MaxMind DB reader module for php"
arch=("x86_64" "i686")
url="https://github.com/maxmind/MaxMind-DB-Reader-php"
license=("Apache-2.0")
provides=("php-maxminddb=${pkgver}-${pkgrel}")
depends=("php" "libmaxminddb")
backup=("etc/php/conf.d/maxminddb.ini")
source=("https://github.com/maxmind/MaxMind-DB-Reader-php/archive/v${pkgver}.tar.gz")
sha256sums=('fae72701e2823a690a27a3c4abb0afeaaaca93fda7795cd00a2b7722d4196b86')

_pkgsrcdir="MaxMind-DB-Reader-php-${pkgver}"

build() {
    cd "${srcdir}/${_pkgsrcdir}/ext"

    phpize
    ./configure
    make
}

check() {
    cd "${srcdir}/${_pkgsrcdir}/ext"
    make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1
}

package() {
    cd "${srcdir}/${_pkgsrcdir}/ext"

    make INSTALL_ROOT="$pkgdir" install
    echo ";extension=maxminddb.so" > maxminddb.ini
    install -Dm644 maxminddb.ini "$pkgdir/etc/php/conf.d/maxminddb.ini"
}
