pkgname=collapseloader-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="A user-friendly loader for many minecraft clients"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'pipewire' 'pipewire-jack' 'pipewire-pulse' 'pipewire-alsa' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
makedepends=('squashfs-tools')
provides=('collapseloader')
conflicts=('collapseloader-git')
source=("collapseloader__${pkgver}_HOTFIX_amd64.AppImage::https://github.com/dest4590/CollapseLoader/releases/download/0.2.9/CollapseLoader__0.2.9_HOTFIX_amd64.AppImage")
sha256sums=('df7a746152a3c6f9a4ea8356db0e847f80f55bd381956ede5a3353e8239ccb90')
noextract=("collapseloader__${pkgver}_HOTFIX_amd64.AppImage")

package() {
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/collapseloader" "${pkgdir}/usr/bin/collapseloader"

    if [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
        install -Dm644 "${srcdir}/squashfs-root/.DirIcon" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/collapseloader.png" "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=CollapseLoader
Comment=A user-friendly loader for many minecraft clients
Exec=collapseloader
Icon=collapseloader
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;
EOF
}
