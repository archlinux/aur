# Maintainer: psychosomat <hello@ddark.dev>

pkgname=openscreen
pkgver=1.12.2
pkgrel=2
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
    "openscreen-LICENSE::https://github.com/getopenscreen/openscreen/raw/v${pkgver}/LICENSE"
)
sha256sums=('bc30aa0a06b07afb74d3f13601ec4bf1b23a92dbd0f7fa6dd2007ad334c0fd3c' '0b7901acee37b04fc948fa01ac25a9d283f78900a43f0f9062a7759cb6bbaa5b')

package() {
    local extractdir="$srcdir/pacman-extract"
    mkdir -p "$extractdir"
    bsdtar -xf "$srcdir/openscreen-$pkgver.pacman" -C "$extractdir"

    cp -a "$extractdir/usr" "$extractdir/opt" "$pkgdir/"

    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/Openscreen/openscreen" "$pkgdir/usr/bin/openscreen"

    install -Dm644 "$srcdir/openscreen-LICENSE" "$pkgdir/usr/share/licenses/openscreen/LICENSE"
}
