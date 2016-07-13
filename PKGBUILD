# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-trace'
pkgver='0.3.0'
pkgrel='1'
pkgdesc='Extension for the tracing and troubleshooting tool for PHP scripts'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/trace'
license=('Apache')
depends=('php>=5.1')
source=("http://pecl.php.net/get/trace-$pkgver.tgz")
sha256sums=('aa5f6a91a77ef11f4102b542847b32fce03ea7777081ebb86a812228526b38f7')

build() {
    pushd "$srcdir/trace-$pkgver/extension"
    phpize
    ./configure
    make
    popd
    pushd "$srcdir/trace-$pkgver"
    echo 'extension=trace.so' > trace.ini
    popd
}

package() {
    pushd "$srcdir/trace-$pkgver/extension"
    make INSTALL_ROOT="$pkgdir" install
    popd
    pushd "$srcdir/trace-$pkgver"
    install -Dm644 trace.ini "$pkgdir/etc/php/conf.d/trace.ini"
    popd
}
