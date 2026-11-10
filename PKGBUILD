# Maintainer: remanifest
pkgname=qamp
pkgver=0.0.3
pkgrel=1
pkgdesc='A modernized Winamp style audio player with vector and classic skins'
arch=(x86_64)
url='https://gitlab.com/remanifest/qamp'
license=('AGPL-3.0-or-later')
depends=(qt6-base qt6-multimedia qt6-multimedia-ffmpeg qt6-svg libzip taglib ffmpeg)
makedepends=(cmake ninja)
optdepends=('xdg-utils: make qamp the default player for audio files from its menu')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('918c7085eb822bcfc122ee62d2d10378f7eb2ed5287bee99287a28cebb1016d0')

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
