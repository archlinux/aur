# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pecl-pq
pkgver=2.1.1
pkgrel=1
pkgdesc='PostgreSQL client library (libpq) binding'
url='https://github.com/m6w6/ext-pq'
arch=('x86_64')
license=('BSD')
depends=('php' 'pecl-raphf')
source=("$url/archive/v$pkgver.zip")
sha256sums=('9fc79983fbf981e41ecf485bdd363ff8a65d9e0e9c99098230a6ea6a2542ea75')

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
