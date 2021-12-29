# Maintainer: Luke Arms <luke@arms.to>

pkgname=php-memprof
_pkgname=${pkgname#php-}
pkgver=3.0.1
pkgrel=1
pkgdesc='Memory profiler for PHP. Helps finding memory leaks in PHP scripts.'
arch=('x86_64')
url='https://github.com/arnaud-lb/php-memory-profiler'
license=('MIT')
depends=('php' 'judy')
source=("http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz")
sha256sums=('00471384e81990e8db9ce9b5e946dad42f313aeff0f1d10a8ce61bb38b02fff5')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    phpize
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    echo ";extension=$_pkgname.so" >"$srcdir/$_pkgname.ini"
    install -Dm644 "$srcdir/$_pkgname.ini" "$pkgdir/etc/php/conf.d/$_pkgname.ini"
}
