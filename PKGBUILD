# Maintainer: Luke Arms <luke@arms.to>

pkgname=php-memprof
_extname=${pkgname#php-}
pkgver=3.0.2
pkgrel=2
pkgdesc='Memory profiler for PHP. Helps finding memory leaks in PHP scripts.'
arch=('x86_64')
url='https://github.com/arnaud-lb/php-memory-profiler'
license=('MIT')
depends=('php' 'judy')
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('510bf09d58487820ac11b617446199ca86c50fda972dde73feaae667be23d183')
backup=("etc/php/conf.d/$_extname.ini")

build() {
    cd "$srcdir/$_extname-$pkgver"
    phpize
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_extname-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    echo ";extension=$_extname.so" >"$srcdir/$_extname.ini"
    install -Dm0644 "$srcdir/$_extname.ini" "$pkgdir/etc/php/conf.d/$_extname.ini"
    install -Dm0644 "$srcdir/$_extname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
