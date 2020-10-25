# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='php-rar'
pkgver='4.1.0'
pkgrel='1'
pkgdesc='PHP PECL extension for reading RAR archives using bundled unRAR library'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/rar'
license=('PHP')
depends=('php>=5.3')
source=("http://pecl.php.net/get/rar-$pkgver.tgz")
sha256sums=('81be7ef7db62d4384b85cb2128f7504ad6ab338486860928af1840f8491983de')

build() {
    cd "$srcdir/rar-$pkgver"
    phpize
    ./configure \
    --prefix=/usr \
    --enable-rar
    make
    echo 'extension=rar.so' > rar.ini
}

package() {
    pushd "$srcdir/rar-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 rar.ini "$pkgdir/etc/php/conf.d/rar.ini"
    popd
}
