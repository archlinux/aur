# Maintainer: Hamza Abdelmoumene <250554870+hamza-abdelmoumene@users.noreply.github.com>
pkgname=vespera
pkgver=0.2.0
pkgrel=1
pkgdesc="Standalone music player companion: MPRIS control, synced lyrics, visualizer and equalizer"
arch=('x86_64' 'aarch64')
url="https://github.com/hamza-abdelmoumene/vespera"
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja')
optdepends=('cava: audio visualizer'
            'easyeffects: 10-band equalizer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Update with: makepkg -g   (or updpkgsums) after the tag is published.
sha256sums=('ab22236f546cf8ff9f26ac3004142c4682e8d2e3928c97d86894d689e337d7f8')

build() {
    cmake -S "$pkgname-$pkgver" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
