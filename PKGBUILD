# Maintainer: Luke Arms <luke@arms.to>

pkgname=php-memprof
_extname=${pkgname#php-}
pkgver=3.1.0
pkgrel=1
pkgdesc='Memory profiler for PHP. Helps finding memory leaks in PHP scripts.'
arch=('x86_64')
url='https://github.com/arnaud-lb/php-memory-profiler'
license=('MIT')
depends=('php' 'judy')
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('231c8866fc86001659e98b0230d4a19799fd5a3621e8e709f490ea0e9cb7a48f')
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
