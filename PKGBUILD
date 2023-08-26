# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=php-pq
pkgver=2.2.2
pkgrel=1
pkgdesc='PostgreSQL client library (libpq) binding'
url='https://github.com/m6w6/ext-pq'
arch=('x86_64')
license=('BSD')
depends=('php' 'php-raphf')
optdepends=('php-json')
replaces=('pecl-pq')
source=("$url/archive/v$pkgver.zip")
sha256sums=('d1ca2e79c966482fedaf5bfed30ec153edb9da5d61e18cec41ed278fa71c56de')

build()
{
    cd "ext-pq-$pkgver"

    phpize
    ./configure
    make
}

package()
{
    cd "ext-pq-$pkgver"

    make INSTALL_ROOT=$pkgdir install
    install -d "$pkgdir/etc/php/conf.d"
    echo ";extension=pq.so" > "$pkgdir/etc/php/conf.d/pq.ini"
}
