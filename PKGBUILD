# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=osu-cpp-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="osu! client written in C++23 and drawn with Skia (prebuilt binary)"
arch=('x86_64')
url="https://github.com/j4niwzis/osu-cpp"
license=('AGPL-3.0-only')
depends=(
    'brotli'
    'hicolor-icon-theme'
    'libffi'
    'libglvnd'
    'libx11'
    'libxcb'
    'mesa'
    'openssl'
    'wayland'
    'zlib'
    'zstd'
)
optdepends=(
    'pipewire: audio output (pipewire-pulse)'
    'pulseaudio: audio output'
)
options=('!strip' '!debug')
source=("osu_client-linux-x86_64::https://github.com/j4niwzis/osu-cpp/releases/download/v${pkgver}/osu_client-linux-x86_64"
        "LICENSE::https://raw.githubusercontent.com/j4niwzis/osu-cpp/v${pkgver}/LICENSE"
        "osu-cpp.svg::https://raw.githubusercontent.com/j4niwzis/osu-cpp/v${pkgver}/standalone/packaging/io.github.j4niwzis.osu_cpp.svg")
sha256sums=('f81d4c6dd19b1259a792152cd9a45769c3a498417509a44b96f459e20ffe5703'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '04611cfd4003a6203e76722b936fc01e5cc7691ea794ffb1aa6d24a3c1dfce96')

package() {
    install -Dm755 "osu_client-linux-x86_64" "${pkgdir}/usr/bin/osu-cpp"

    install -Dm644 "osu-cpp.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/osu-cpp.svg"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/osu-cpp.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=osu!cpp
Comment=Play osu! beatmaps with a native C++ client
Exec=osu-cpp %F
Icon=osu-cpp
Terminal=false
Categories=Game;ArcadeGame;
Keywords=osu;rhythm;music;beatmap;
MimeType=application/x-osu-beatmap-archive;
StartupNotify=true
EOF

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}