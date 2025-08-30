# Maintainer: William Tang <galaxyking0419@gmail.com>
# Contributor: Bruce Zhang
# Contributor: lilac <lilac@build.archlinuxcn.org>
# Contributor: 吕海涛 <aur@lvht.net>

_extname=swoole
pkgname=php-$_extname
pkgver=6.0.2
pkgrel=1
pkgdesc='Coroutine-based concurrency library for PHP'
arch=('x86_64')
url='https://github.com/swoole/swoole-src'
license=('Apache-2.0')
depends=('php-pgsql')
makedepends=('autoconf' 'gcc' 'make')

source=("https://github.com/swoole/swoole-src/archive/refs/tags/v$pkgver.tar.gz" "$_extname.ini")
sha256sums=('b0bd47292add791b3bcebf347cd593c98a71c098dfeb96d125193bc95e95ed2f'
            '970534465ebbbf9be58ec8dba5399f7b9473c432cb5b42098125b4bcf1fdef85')

build() {
    cd $_extname-src-$pkgver
    phpize
    ./configure --enable-swoole-curl --enable-swoole-pgsql
    make
}

package() {
    mkdir -p "$pkgdir"/etc/php/conf.d \
        "$pkgdir"/usr/include/php/ext \
        "$pkgdir"/usr/lib/php/modules \
        "$pkgdir"/usr/share/licenses/$pkgname

    cp $_extname.ini "$pkgdir"/etc/php/conf.d/

    cd $_extname-src-$pkgver
    cp -a include "$pkgdir"/usr/include/php/ext/$_extname
    mv .libs/$_extname.so "$pkgdir"/usr/lib/php/modules/
    cp LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
