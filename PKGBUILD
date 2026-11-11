# Maintainer: remanifest
pkgname=qamp
pkgver=0.0.4
pkgrel=2
pkgdesc='A modernized Winamp style audio player with vector and classic skins'
arch=(x86_64)
url='https://gitlab.com/remanifest/qamp'
license=('AGPL-3.0-or-later')
depends=(qt6-base qt6-multimedia qt6-multimedia-ffmpeg qt6-svg libzip taglib ffmpeg)
makedepends=(cmake ninja)
optdepends=('xdg-utils: make qamp the default player for audio files from its menu')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('ac24f9a2d15f42de413b84c8dad87a31629cd4adb7e9aafb0214a3325e68405b')

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
