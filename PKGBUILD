# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='php-rar'
pkgver='4.2.0'
pkgrel='1'
pkgdesc='PHP PECL extension for reading RAR archives using bundled unRAR library'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/rar'
license=('PHP')
depends=('php>=5.3')
source=("http://pecl.php.net/get/rar-$pkgver.tgz")
sha256sums=('660d7d6bc97cc45395e56621aa8803a9f9d4b3436c576d67afe712c8f964a4b9')

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
