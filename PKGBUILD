# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=php56-ncurses
pkgver=1.0.2
pkgrel=3
pkgdesc="Terminal screen handling and optimization package"
url="http://pecl.php.net/package/ncurses"
arch=('x86_64' 'i686')
license=('PHP')
depends=('php56' 'ncurses')
backup=('etc/php56/conf.d/ncurses.ini')

source=(
    "http://pecl.php.net/get/ncurses-${pkgver}.tgz"
)

sha512sums=(
    'e1f684dcab2aa4dd3fded79fed02c78de1525f0384027fe64ad08759617f13ca6fb11742e3407723eecc431ed99847c0c98ae559797dc98ce373a01ba8413bf2'
)

build() {
    cd "$srcdir/ncurses-$pkgver"

    phpize56
    ./configure --prefix=/usr --with-ncurses
    make
}

package() {
    cd "$srcdir/ncurses-$pkgver"

    make INSTALL_ROOT="$pkgdir" install
    echo 'extension=ncurses.so' > ncurses.ini 
    install -Dm644 ncurses.ini "$pkgdir/etc/php56/conf.d/ncurses.ini"
}
