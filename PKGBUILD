# Maintainer: Chocobo1

pkgname=chewing-editor
pkgver=0.0.3
pkgrel=1
pkgdesc="Cross platform chewing user phrase editor"
arch=('i686' 'x86_64')
url="http://chewing.im"
license=('GPL')
depends=('libchewing' 'qt5-base' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'help2man')
install=$pkgname.install
source=("https://github.com/chewing/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f49a024139aa6bab7b6aa980a0c7ec03c25e4b019d52386d3d10bf7d88c2382a')

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
