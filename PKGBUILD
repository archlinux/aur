# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='php-rar'
pkgver='4.0.0'
pkgrel='1'
pkgdesc='PHP PECL extension for reading RAR archives using bundled unRAR library'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/rar'
license=('PHP')
depends=('php>=5.3' 'php<7.0')
source=("http://pecl.php.net/get/rar-$pkgver.tgz")
sha256sums=('2ac503b242b3f0192c12093dd9dd72da32126c39e23cd423a4ec41af9a7b8279')

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
