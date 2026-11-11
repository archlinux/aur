# Maintainer: Nasir A <evilleader91@gmail.com>
pkgname=steam-library-mover
pkgver=0.1.9
pkgrel=1
pkgdesc="Move installed Steam games between Steam libraries safely"
arch=('x86_64')
url="https://github.com/NasirA1991/steam-library-mover"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja')
optdepends=('steam: native Steam client'
            'flatpak: Flatpak Steam client')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df9398aab47cad12e0d04513520cfecc63885f9c9451fc0b5eed9ea9062afab6')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure --timeout 60
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
