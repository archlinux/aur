# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='php-rar'
pkgver='3.0.2'
pkgrel='2'
pkgdesc='PHP PECL extension for reading RAR archives using bundled unRAR library'
arch=('i686' 'x86_64')
url='http://pecl.php.net/package/rar'
license=('PHP')
depends=('php>=5.2.0')
source=("http://pecl.php.net/get/rar-$pkgver.tgz")
sha256sums=('37841aea7c91afe2a250afc28bcdc7d6807f8aa3a2411a1c121f17252f66f21d')

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
