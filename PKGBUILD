# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='php-svn'
pkgver='1.0.3'
pkgrel='1'
pkgdesc='PHP PECL extension to provide bindings for the Subversion revision control system'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/svn'
license=('PHP')
depends=('php>=4.0' 'php<7.0' 'subversion')
source=("http://pecl.php.net/get/svn-$pkgver.tgz")
sha256sums=('8ccf1dd78b92649486d1875102ecb899c1e4e5ddf674f2d87adf611c16295089')

build() {
    cd "$srcdir/svn-$pkgver"
    phpize
    ./configure \
    --prefix=/usr \
    --with-php-config=/usr/bin/php-config56
    make
    echo 'extension=svn.so' > svn.ini
}

package() {
    pushd "$srcdir/svn-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 svn.ini "$pkgdir/etc/php56/conf.d/svn.ini"
    popd
}
