# Maintainer: Hamza Abdelmoumene <250554870+hamza-abdelmoumene@users.noreply.github.com>
pkgname=vespera
pkgver=0.1.0
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
sha256sums=('36b1cc5705b292bd0a1f8e4f2b561268118cf75828b1e451910506a3642a9974')

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
