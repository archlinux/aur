# Maintainer: ardet696 <https://github.com/ardet696>
pkgname=minimalist-mp3-player
pkgver=1.0.3
pkgrel=1
pkgdesc="A minimalist TUI MP3 player with FFT spectrum visualizer and BPM detection"
arch=('x86_64')
url="https://github.com/ardet696/MinimalistMP3Player"
license=('MIT')
depends=('sdl2')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver::git+https://github.com/ardet696/MinimalistMP3Player.git#tag=v$pkgver")
sha256sums=('9441b715ddf2382bd8253bfeb960ec0ffeeff1460d50e715fb584d8c6885cb06')

prepare() {
    cd "$pkgname-$pkgver"
    git submodule update --init --recursive
}

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
