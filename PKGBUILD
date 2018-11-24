# Maintainer: Jan-Jaap Korpershoek <jjkorpershoek96 at gmail dot com>
pkgname=php-language-server
pkgver=5.4.6
pkgrel=1
pkgdesc="PHP language server implementation"
arch=('x86_64')
url="https://github.com/felixfbecker/php-language-server"
license=('ISC')
depends=('php>=7')
makedepends=('composer')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/felixfbecker/$pkgname/archive/v$pkgver.tar.gz"
    "php-language-server"
)
md5sums=('3934a16509185f1def5040099710fbc9'
         'cb882eef5bc51ae553fdc7c43d181544')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    composer install
    composer run-script parse-stubs
}

package() {
    path=$pkgdir/usr/share/php/$pkgname
    mkdir -p $path
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 php-language-server "$pkgdir/usr/bin/"
    cd "$srcdir/$pkgname-$pkgver"
    cp -dr --no-preserve=ownership . "$path"
}
