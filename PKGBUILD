# Maintainer: Nicholas Yim <nickyim05@gmail.com>

extname=event
pkgname="php-$extname"
pkgver='2.3.0'
pkgrel='1'
pkgdesc='PHP PECL extension providing interface to libevent library'
arch=('x86_64')
url="https://pecl.php.net/package/$extname"
license=('PHP')
depends=('php>=7.0','libevent')
source=("http://pecl.php.net/get/$extname-$pkgver.tgz")
sha256sums=('10e37f2b1c47475be891ef84b4282b5739d9aa8a1facd0c0141ee0edc3048435')

build() {
    cd "$srcdir/$extname-$pkgver"
    phpize
    ./configure \
    --prefix=/usr
    make
    echo "extension=$extname.so" > $extname.ini
}

package() {
    pushd "$srcdir/$extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 $extname.ini "$pkgdir/etc/php/conf.d/$extname.ini"
    popd
}
