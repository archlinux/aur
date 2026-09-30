# Maintainer: Hamza Abdelmoumene <250554870+hamza-abdelmoumene@users.noreply.github.com>
pkgname=vespera
pkgver=0.2.1
pkgrel=2
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
sha256sums=('d00212edfaead47dc598178d26f290b7a1faa9ef93b5f8ff793caf4c89170cb0')

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
