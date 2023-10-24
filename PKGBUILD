pkgname=kmozillahelper
pkgver=5.0.6
pkgrel=2
epoch=1
pkgdesc="Mozilla KDE Integration."
url="https://github.com/openSUSE/kmozillahelper"
arch=("i686" "x86_64")
license=('MIT')
depends=("kio5" "knotifications5" "kwindowsystem5" "ki18n5")
makedepends=("cmake" "extra-cmake-modules")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/kmozillahelper/archive/v${pkgver}.tar.gz")
md5sums=('382142073322f942f4d332fffb77ef25')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
