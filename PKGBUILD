# Maintainer: Maxim Balashov <me@rsg.su>

pkgname=ayugram-desktop-bin
pkgver=7.0.9
pkgrel=1
pkgdesc="Desktop Telegram client with good customization and Ghost mode"
arch=(x86_64)
url="https://github.com/AyuGram/AyuGramDesktop"
license=('GPL-3.0-or-later')
depends=(
    'abseil-cpp' 'ada' 'ffmpeg' 'glib2' 'glibc' 'hicolor-icon-theme'
    'hunspell' 'kcoreaddons' 'libavif' 'libdispatch' 'libgcc' 'libheif'
    'libjpeg-turbo' 'libjxl' 'libstdc++' 'libvpx' 'libx11' 'libxcb'
    'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
    'libxrandr' 'libxtst' 'lz4' 'minizip' 'openal' 'openh264' 'openssl'
    'opus' 'libpipewire' 'protobuf' 'qt6-base' 'qt6-declarative'
    'qt6-svg' 'qt6-wayland' 'rnnoise'
    'xcb-util-keysyms' 'xxhash' 'zlib'
)
optdepends=(
    'geoclue: geoinformation support'
    'geocode-glib-2: geocoding support'
    'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
    'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
    'xdg-desktop-portal: desktop integration'
)
provides=('ayugram-desktop')
conflicts=('ayugram-desktop')
options=('!debug')

source=("https://cdn77.cachyos.org/repo/${CARCH}/cachyos/ayugram-desktop-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst")
sha256sums=('489ea49547a2759112ab97fa135c7eee906cf95b7c43f570e94bbd54429f3d0c')

package() {
    # Binary
    install -Dm755 "$srcdir/usr/bin/AyuGram" "$pkgdir/usr/bin/AyuGram"

    # Desktop entry
    install -Dm644 "$srcdir/usr/share/applications/com.ayugram.desktop.desktop" \
        "$pkgdir/usr/share/applications/com.ayugram.desktop.desktop"

    # DBus service
    install -Dm644 "$srcdir/usr/share/dbus-1/services/com.ayugram.desktop.service" \
        "$pkgdir/usr/share/dbus-1/services/com.ayugram.desktop.service"

    # Metainfo
    install -Dm644 "$srcdir/usr/share/metainfo/com.ayugram.desktop.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/com.ayugram.desktop.metainfo.xml"

    # Standard icons
    local icon_size
    for icon_size in 16 32 48 64 128 256 512; do
        install -Dm644 "$srcdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/com.ayugram.desktop.png" \
            "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/com.ayugram.desktop.png"
    done

    # HiDPI (@2x) icons
    for icon_size in 16 32 48 64 128 256 512; do
        install -Dm644 "$srcdir/usr/share/icons/hicolor/${icon_size}x${icon_size}@2/apps/com.ayugram.desktop.png" \
            "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}@2/apps/com.ayugram.desktop.png"
    done

    # Symbolic icons
    local sym_icon
    for sym_icon in com.ayugram.desktop-attention-symbolic.svg \
                    com.ayugram.desktop-mute-symbolic.svg \
                    com.ayugram.desktop-symbolic.svg; do
        install -Dm644 "$srcdir/usr/share/icons/hicolor/symbolic/apps/${sym_icon}" \
            "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${sym_icon}"
    done
}
