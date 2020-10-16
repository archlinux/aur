# Maintainer: Leo <i@setuid0.dev>

_extname=uuid
pkgname="php-$_extname"
pkgver='1.2.0'
pkgrel='1'
pkgdesc='PHP PECL UUID extension'
arch=('x86_64')
url="https://pecl.php.net/package/$_extname"
license=('LGPL')
depends=('php>=7.0')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('5cb834d32fa7d270494aa47fd96e062ef819df59d247788562695fd1f4e470a4')

build() {
    cd "$srcdir/$_extname-$pkgver"
    phpize
    ./configure \
    --prefix=/usr \
    --with-uuid
    make
    echo -ne "n" | make test
    echo -ne "\n"
    echo "extension=$_extname" > $_extname.ini
}

package() {
    pushd "$srcdir/$_extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm644 $_extname.ini "$pkgdir/etc/php/conf.d/$_extname.ini"
    popd
}
