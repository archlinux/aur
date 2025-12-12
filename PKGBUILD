maintainer=dest4590@collapseloader.org
pkgname=collapseloader-bin
pkgver=0.2.4
pkgrel=3
pkgdesc="GUI utility for launching Minecraft clients (binary)"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('GPL-3.0-only')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'pipewire' 'pipewire-jack' 'pipewire-pulse' 'pipewire-alsa' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
provides=('collapseloader')
conflicts=('collapseloader-git')
source=("collapseloader-0.2.4_amd64_HOTFIX2.AppImage::https://github.com/dest4590/CollapseLoader/releases/download/0.2.4/collapseloader_0.2.4_amd64_HOTFIX2.AppImage")
sha256sums=('35ef4c60daebd22941f633e5fd7edec1d4bd4208bf60bb60b41296796432d1f5')
noextract=("collapseloader-${pkgver}_amd64_HOTFIX2.AppImage")

prepare() {
  chmod +x "${srcdir}/collapseloader-${pkgver}_amd64_HOTFIX2.AppImage"

  cd "${srcdir}"
  "${srcdir}/collapseloader-${pkgver}_amd64_HOTFIX2.AppImage" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/collapseloader" "${pkgdir}/usr/bin/collapseloader"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=0.2.4
Type=Application
Name=CollapseLoader
Comment=GUI utility for launching Minecraft clients (stable)
Exec=collapseloader
Icon=collapseloader
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;
EOF
}
