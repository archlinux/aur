# Maintainer: Chocobo1

pkgname=chewing-editor
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross platform chewing user phrase editor"
arch=('i686' 'x86_64')
url="http://chewing.im"
license=('GPL')
depends=('libchewing' 'qt5-base' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'help2man')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/chewing/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f769ec40b22c4d9bb3e1b68d62e4fade40e057131a5986e37772698131235693')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    mkdir build
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"

    cmake ../ -DCMAKE_INSTALL_PREFIX='/usr'
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver/build"

    ./run-test
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"

    make DESTDIR="$pkgdir" install
    install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
