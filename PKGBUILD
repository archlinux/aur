# Maintainer: xaprier <seymenkalkan@gmail.com>
pkgname=xound
pkgver=2.0.0
pkgrel=1
pkgdesc='PipeWire audio control: equalizer, noise suppression, mic monitor, soundboard, patchbay and device controls'
arch=('x86_64' 'aarch64')
url='https://github.com/xaprier/Xound'
license=('MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libpulse' 'pipewire' 'pipewire-pulse' 'qt6-base' 'qt6-declarative' 'qt6-svg')
makedepends=('cmake' 'ninja')
optdepends=('ffmpeg: play every sound format on the soundboard'
            'noise-suppression-for-voice: RNNoise noise suppression')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de56a1e1f0456319a42bbb54a0aec9675fa25b08d46eb62ea8f7c23e00d768d3')

build() {
    cmake -S "Xound-$pkgver" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "Xound-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
