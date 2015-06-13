# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=tsl
pkgver=0.40
pkgrel=2
pkgdesc="The Slimy Lichmummy, a fantasy/cyberpunk roguelike"
arch=('i686' 'x86_64')
url="http://www.happyponyland.net/roguelike.php"
license=("custom")
depends=('ncurses' 'allegro')
source=("http://www.happyponyland.net/files/$pkgname-$pkgver.tar.gz" $pkgname.sh)
md5sums=('8cd6942d09357e27591b0cbcc06a43b2'
         '9d6664d3fc124d5afadb48ce60de890b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's/-o tsl/&-tty/' build_console.sh
    ./build_console.sh
    ./build_gui.sh
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
    mkdir -p "$pkgdir/opt/$pkgname"
    cp $pkgname $pkgname-tty README.TXT *.png *.tga tsl_conf* "$pkgdir/opt/$pkgname"
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
