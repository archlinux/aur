# Contributor: BryanLiang <liangrui.ch at gmail dot com>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="qbittorrent-enhanced"
pkgname="${_pkgname}"-appimage
pkgver=5.1.3.10
pkgrel=1
pkgdesc="A bittorrent client powered by C++, Qt and the good libtorrent library (Enhanced Edition)"
arch=('x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('GPL-2.0-or-later AND GPL-3.0-or-later AND custom')
options=('!strip' '!debug')
depends=('fuse2' 'hicolor-icon-theme' 'zlib')
provides=('qbittorrent')
conflicts=('qbittorrent')
source=("$url/raw/release-$pkgver/COPYING")
source_x86_64=(
    "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/release-${pkgver}/qBittorrent-Enhanced-Edition-x86_64.AppImage"
)

sha256sums=('e675cd856f9817474455200ba7e6f5b7cc42d6598a5eecbbbdaa0e6fd304d6b7')
sha256sums_x86_64=('29ff41b282ce8c30251bdedd6d4f34ed00e49e349b1a5580ac11c0d5a2b25837')

prepare () {
    chmod +x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/qbittorrent"

    install -Dm644 "${srcdir}/squashfs-root/org.qbittorrent.qBittorrent.desktop" "${pkgdir}/usr/share/applications/org.qbittorrent.qBittorrent.desktop"

    for size in 16 22 24 32 36 48 64 72 96 128 192
    do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/qbittorrent.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/qbittorrent.png"
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/status/qbittorrent-tray.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/status/qbittorrent-tray.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/qbittorrent.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/qbittorrent.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/status/qbittorrent-tray.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/status/qbittorrent-tray.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/status/qbittorrent-tray-light.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/status/qbittorrent-tray-light.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/status/qbittorrent-tray-dark.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/status/qbittorrent-tray-dark.svg"

    install -Dm644 "${srcdir}/squashfs-root/usr/share/man/man1/qbittorrent.1" "${pkgdir}/usr/share/man/man1/qbittorrent.1"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/man/ru/man1/qbittorrent.1" "${pkgdir}/usr/share/man/ru/man1/qbittorrent.1"

    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/org.qbittorrent.qBittorrent.metainfo.xml" "${pkgdir}/usr/share/metainfo/org.qbittorrent.qBittorrent.metainfo.xml"

    install -Dm644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/qbittorrent-enhanced/COPYING"
}
