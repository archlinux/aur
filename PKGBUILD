# Maintainer: Martin Etchebarne <martin@etchebarne.net>
pkgname=kosmos-bin
pkgver=0.4.9
pkgrel=1
pkgdesc="A modern code editor."
arch=('x86_64')
url="https://github.com/etchebarne/kosmos"
license=('MIT')
depends=(
    'fontconfig'
    'hicolor-icon-theme'
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'vulkan-driver'
    'vulkan-icd-loader'
    'ttf-dejavu'
    'wayland'
)
provides=('kosmos')
conflicts=('kosmos')
source=("kosmos-linux-${arch}-${pkgver}.tar.gz::https://github.com/etchebarne/kosmos/releases/download/v${pkgver}/kosmos-linux-${arch}.tar.gz")
sha256sums=('b5def23889df43b158cf114760e1acb4852a1d8698673a4a28e8121876aca175')

package() {
    local appdir="$pkgdir/opt/kosmos"
    install -d "$appdir"
    cp -r "$srcdir/Kosmos.app/." "$appdir/"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/kosmos/bin/kosmos "$pkgdir/usr/bin/kosmos"

    install -Dm644 "$appdir/share/applications/net.etchebarne.Kosmos.desktop" \
        "$pkgdir/usr/share/applications/net.etchebarne.Kosmos.desktop"

    for size in 16 32 48 64 128 256 512; do
        install -Dm644 "$appdir/share/icons/hicolor/${size}x${size}/apps/kosmos.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kosmos.png"
    done
    install -Dm644 "$appdir/share/icons/hicolor/scalable/apps/kosmos.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/kosmos.svg"

    install -Dm644 "$appdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    rm -rf "$appdir/share/applications" "$appdir/share/icons" "$appdir/LICENSE"
}
