pkgname=collapseloader-bin
pkgver=0.2.7
pkgrel=6
pkgdesc="GUI utility for launching Minecraft clients (binary)"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'pipewire' 'pipewire-jack' 'pipewire-pulse' 'pipewire-alsa' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
provides=('collapseloader')
conflicts=('collapseloader-git')
source=("collapseloader-${pkgver}_amd64.AppImage::https://github.com/dest4590/CollapseLoader/releases/download/prerelease-v0.2.7-2fa1e99/collapseloader_0.2.7_amd64.AppImage")
sha256sums=('50568acc6faa481e1365a9b50b22885a370d10f987269c98f9a9f0d1fa260fe7')
noextract=("collapseloader-${pkgver}_amd64.AppImage")

prepare() {
    chmod +x "${srcdir}/collapseloader-${pkgver}_amd64.AppImage"
    cd "${srcdir}"
    "${srcdir}/collapseloader-${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/collapseloader" "${pkgdir}/usr/bin/collapseloader"

    if [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
        install -Dm644 "${srcdir}/squashfs-root/.DirIcon" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/collapseloader.png" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=0.2.6
Type=Application
Name=CollapseLoader
Comment=GUI utility for launching Minecraft clients
Exec=collapseloader
Icon=collapseloader
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;
EOF
}
