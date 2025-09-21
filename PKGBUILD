# Maintainer: wang1zhen <wang1zhen07@gmail.com>
pkgname=musiclyricapp
pkgver=7.2
pkgrel=7
pkgdesc="云音乐歌词获取处理工具【网易云、QQ音乐】"
arch=('x86_64')
url="https://github.com/jitwxs/163MusicLyrics"
license=('Apache-2.0')
depends=('fontconfig' 'freetype2' 'libx11' 'libxrandr' 'libxcursor' 'libxi' 'libxext' 'libxfixes' 'libxinerama' 'krb5' 'openssl' 'zlib' 'icu')
makedepends=()
optdepends=('ttf-dejavu: for better font rendering')
provides=('musiclyricapp')
conflicts=('musiclyricapp-git')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jitwxs/163MusicLyrics/releases/download/v${pkgver}/MusicLyricApp-v${pkgver}-linux-x64.tar.gz"
        "app-logo.png::https://github.com/jitwxs/163MusicLyrics/raw/refs/heads/master/cross-platform/MusicLyricApp/Resources/app-logo.png")
sha256sums=('8a335a6b0c80deec3ffad0f1c24fa0b3a27b86f30e6bfbc26423ea202b5c7c92'
            'SKIP')
noextract=()
options=('!strip')

package() {
    # Create directories
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/pixmaps"

    # Copy only the actual application files (not symlinks to build files)
    install -Dm755 "${srcdir}/MusicLyricApp" "${pkgdir}/opt/${pkgname}/MusicLyricApp"
    install -Dm644 "${srcdir}/NLog.config" "${pkgdir}/opt/${pkgname}/NLog.config"

    # Create symlink to /usr/bin
    ln -s "/opt/${pkgname}/MusicLyricApp" "${pkgdir}/usr/bin/musiclyricapp"

    # Install desktop file
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Type=Application
Name=MusicLyricApp
GenericName=Music Lyrics Downloader
Comment=Music lyrics downloader for NetEase Cloud Music and QQ Music
Exec=musiclyricapp
Icon=musiclyricapp
Categories=AudioVideo;Audio;Music;
Terminal=false
StartupWMClass=MusicLyricApp
MimeType=
Keywords=music;lyrics;netease;qq;
EOF

    # Copy the actual application icon
    install -Dm644 "${srcdir}/app-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
