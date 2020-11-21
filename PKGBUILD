# Maintainer: Mattéo Delabre <spam@delab.re>
pkgname=nodeeditor
pkgver=2.1.3
pkgrel=1
pkgdesc="Qt-based library aimed at graph-controlled data processing"
arch=(x86_64)
url="https://github.com/paceholder/nodeeditor"
license=(BSD)
depends=(qt5-base)
makedepends=(cmake)
_commit=a939cf865933d797483694f797e06e1f1c8cdb27
source=("https://github.com/paceholder/$pkgname/archive/$_commit.zip")
sha256sums=('51f10275e61451f18cf3c4fc1a9954bf691bb9786459ae30cff8765b4e909288')

build() {
    cmake -B build -S "$pkgname-$_commit" \
        -DBUILD_TESTING=ON \
        -DBUILD_EXAMPLES=OFF \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make DESTDIR="$pkgdir/" -C build install
    install -Dm 644 -t "$pkgdir/usr/share/licenses/nodeeditor" "$pkgname-$_commit/LICENSE"
}
