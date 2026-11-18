# Maintainer: remanifest
pkgname=qamp
pkgver=0.2.3
pkgrel=1
pkgdesc='A modernized Winamp style audio player with vector and classic skins'
arch=(x86_64)
url='https://gitlab.com/remanifest/qamp'
license=('AGPL-3.0-or-later')
depends=(qt6-base qt6-multimedia qt6-multimedia-ffmpeg qt6-svg libzip taglib ffmpeg libcdio libdiscid libxcb)
makedepends=(cmake ninja)
optdepends=('xdg-utils: make qamp the default player for audio files from its menu')
options=(!debug)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('65f1b742e2c4a4a9b19231fe1eec65b145f2307e4d346b55eb781ad8e3632a72')

build() {
    cmake -S "$pkgname-v$pkgver" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
