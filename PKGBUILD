# Maintainer: Chocobo1

pkgname=chewing-editor
pkgver=0.1.1
pkgrel=1
pkgdesc="Cross platform chewing user phrase editor"
arch=('i686' 'x86_64')
url="http://chewing.im"
license=('GPL')
depends=('libchewing' 'qt5-base' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'help2man')
install=$pkgname.install
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/chewing/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ad59ba32bb258d7a1ee6c105a4be54357d2de18cc324277a1429f53fbb23709b')

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
