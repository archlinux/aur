# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php56-trace'
pkgver='1.0.1beta'
pkgrel='1'
pkgdesc='Extension for the tracing and troubleshooting tool for PHP scripts'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/trace'
license=('Apache')
depends=('php>=5.2', 'php<7.0')
provides=('php-trace')
source=("http://pecl.php.net/get/trace-$pkgver.tgz")
sha256sums=('82d50603cd8bc1142e42e3baa9a2f75253ef157fed170d543e7be4ad214aa4e6')

build() {
    pushd "$srcdir/trace-$pkgver/extension"
    phpize56
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
    install -Dm644 trace.ini "$pkgdir/etc/php56/conf.d/trace.ini"
    popd
}
