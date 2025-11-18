# Maintainer: Burhanverse <contact@burhanverse.eu.org>
pkgname=fagram-bin
pkgver=1.1.11
pkgrel=1
pkgdesc="Telegram Desktop based messenger with Feature-rich modifications."
arch=(x86_64)
url="https://github.com/burhancodes/fagramdesktop"
license=(GPL3)
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'libxdamage' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'kcoreaddons' 'jemalloc' 'openh264')
makedepends=('chrpath')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=('fagram')
conflicts=('fagram')
options=(!debug)

source=("https://github.com/burhancodes/fagram-rpm/releases/download/v${pkgver}/fagram-${pkgver}.tar.gz")

sha256sums=('SKIP')

package() {
    cd "${srcdir}/"

    # Creating needed directories
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/dbus-1"
    install -dm755 "${pkgdir}/usr/share/icons"
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -dm755 "${pkgdir}/usr/share/metainfo"

    # Application executable
    install -Dm755 "${srcdir}/usr/bin/fagram" "${pkgdir}/usr/bin/fagram"

    # Remove RPATH informations
    chrpath --delete "${pkgdir}/usr/bin/fagram"

    # Desktop launcher
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/org.fagram.png" "${pkgdir}/usr/share/pixmaps/fagram.png"
    install -Dm644 "${srcdir}/usr/share/applications/org.fagram.desktop" "${pkgdir}/usr/share/applications/org.fagram.desktop"

    # DBus service
    install -Dm644 "${srcdir}/usr/share/dbus-1/services/org.fagram.service" "${pkgdir}/usr/share/dbus-1/services/org.fagram.service"

    # Metainfo
    install -Dm644 "${srcdir}/usr/share/metainfo/org.fagram.metainfo.xml" "${pkgdir}/usr/share/metainfo/org.fagram.metainfo.xml"

    # Icons
    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${icon_dir}"
        install -m644 "${srcdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/org.fagram.png" "${icon_dir}/org.fagram.png"
    done

    # Symbolic icons
    install -d "${pkgdir}/usr/share/icons/hicolor/symbolic/apps"
    install -m644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-symbolic.svg"
    install -m644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-mute-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-mute-symbolic.svg"
    install -m644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-attention-symbolic.svg" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/org.fagram-attention-symbolic.svg"
}

