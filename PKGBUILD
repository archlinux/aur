# Maintainer: wkk-dev <wkk-dev@qq.com>

pkgname=soto-player-community-bin
pkgver=2.3.8
pkgrel=1
pkgdesc="Soto Player-Community - 现代化桌面音乐播放器"
arch=('x86_64')
url="https://github.com/Krits03/Soto-Player-Community"
license=('AGPL-3.0')
depends=('fuse2' 'libappindicator-gtk3')
optdepends=('pipewire: audio playback'
            'pulseaudio: audio playback')
source=("soto-player-community-${pkgver}-x86_64.AppImage::https://github.com/Krits03/Soto-Player-Community/releases/download/v${pkgver}/soto-player-community-${pkgver}-x86_64.AppImage"
        "soto-player-community.png::https://raw.githubusercontent.com/Krits03/Soto-Player-Community/master/public/icons/favicon.png")
sha256sums=('6a43fb22dc3f79e9f98dc39963e1fbc27dcc2009c47f444fd73a5b1e44d89581'
            'f3f4f3f17b9ced4d6258f5ece1f76693f33ee7d5d2629efb56e4a6e071b1cd83')

package() {
  # Install AppImage to /opt
  install -Dm755 "${srcdir}/soto-player-community-${pkgver}-x86_64.AppImage" \
    "${pkgdir}/opt/soto-player-community/soto-player-community.AppImage"

  # Symlink to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/soto-player-community/soto-player-community.AppImage" \
    "${pkgdir}/usr/bin/soto-player-community"

  # Desktop entry
  mkdir -p "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/soto-player-community.desktop" << 'DESKEOF'
[Desktop Entry]
Name=Soto Player-Community
Comment=Cross-platform desktop music player with rich lyric support
Exec=soto-player-community
Icon=soto-player-community
Terminal=false
Type=Application
Categories=Audio;Music;Player;
StartupWMClass=soto-player-community
MimeType=audio/mpeg;audio/flac;audio/wav;audio/ogg;audio/aac;
DESKEOF
  chmod 644 "${pkgdir}/usr/share/applications/soto-player-community.desktop"

  # Icon
  install -Dm644 "${srcdir}/soto-player-community.png" \
    "${pkgdir}/usr/share/pixmaps/soto-player-community.png"

  # Also set icon in hicolor for better DE support
  install -Dm644 "${srcdir}/soto-player-community.png" \
    "${pkgdir}/usr/share/icons/hicolor/120x120/apps/soto-player-community.png"
}
