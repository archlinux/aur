# Maintainer: sunkhan
pkgname=decibell
pkgver=0.2.0
pkgrel=1
pkgdesc="Decentralized text, voice chat, and streaming app"
arch=('x86_64')
url="https://github.com/sunkhan/decibell"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
    'librsvg'
    'pipewire'
    'libpipewire'
    'opus'
    'ffmpeg'
    'dbus'
)
provides=('decibell')
conflicts=('decibell-bin' 'decibell-git')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/sunkhan/decibell/releases/download/v${pkgver}/Decibell_${pkgver}_amd64.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    cd "${srcdir}/squashfs-root"

    # Binary
    install -Dm755 "usr/bin/decibell" "${pkgdir}/usr/bin/decibell"

    # Desktop entry
    install -Dm644 "usr/share/applications/Decibell.desktop" \
        "${pkgdir}/usr/share/applications/Decibell.desktop"

    # Icons
    for icon in usr/share/icons/hicolor/*/apps/decibell.png; do
        size_dir="$(echo "$icon" | grep -oP 'hicolor/\K[^/]+')"
        install -Dm644 "$icon" \
            "${pkgdir}/usr/share/icons/hicolor/${size_dir}/apps/decibell.png"
    done
}
