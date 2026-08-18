# Maintainer: psychosomat <hello@ddark.dev>

pkgname=openscreen
pkgver=1.9.6
pkgrel=1
pkgdesc="Create stunning demos for free. Open-source, no subscriptions, no watermarks, and free for commercial use. An alternative to Screen Studio."
arch=('x86_64')
url="https://github.com/getopenscreen/openscreen"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
conflicts=('openscreen-appimage')
options=(!debug !strip)
noextract=("openscreen-${pkgver}.pacman")
source=(
    "openscreen-${pkgver}.pacman::https://github.com/getopenscreen/openscreen/releases/download/v${pkgver}/Openscreen-Linux-${pkgver}.pacman"
    "LICENSE::https://github.com/getopenscreen/openscreen/raw/v${pkgver}/LICENSE"
)
sha256sums=('e85e3c0357e2a038abb6e552a69dd22be02a311fdc830e5452fdd4a124b2cf2a' 'd8824b8c038eba113227cc707ac22c7a497583ae6115b052729a1d104f692d82')

package() {
    local extractdir="$srcdir/pacman-extract"
    mkdir -p "$extractdir"
    bsdtar -xf "$srcdir/openscreen-$pkgver.pacman" -C "$extractdir"

    cp -a "$extractdir/usr" "$extractdir/opt" "$pkgdir/"

    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/Openscreen/openscreen" "$pkgdir/usr/bin/openscreen"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/openscreen/LICENSE"
}
