# Contributor: gryffyn <me@gryffyn.io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=archiveweb.page-appimage
pkgver=0.16.2
pkgrel=1
pkgdesc="An Electron based application for interactive, high-fidelity web archiving"
arch=('x86_64')
url="https://github.com/webrecorder/archiveweb.page"
license=('AGPL-3.0-or-later')
depends=('fuse2' 'glibc' 'hicolor-icon-theme' 'zlib')
options=(!strip)
source=("${url}/releases/download/v${pkgver}/ArchiveWeb.page-${pkgver}.AppImage"
        "ArchiveWeb.page.desktop")
sha256sums=('25a1b0a16181b7d333eb37247ece8e825852dbda0761863d61e381e0830a90fa'
            '62b378eaad8f542f85c8c0a90b6ab6f9bec8f48d0924eb0cafb1521403573cb1')

prepare() {
    sed -i "s/{pkgversion}/${pkgver}/" ArchiveWeb.page.desktop

    chmod +x "ArchiveWeb.page-${pkgver}.AppImage"
    "./ArchiveWeb.page-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "ArchiveWeb.page-${pkgver}.AppImage" "${pkgdir}/opt/ArchiveWeb.page/ArchiveWeb.page.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/ArchiveWeb.page/ArchiveWeb.page.AppImage "${pkgdir}/usr/bin/ArchiveWeb.page"

    install -Dm644 "ArchiveWeb.page.desktop" -t "${pkgdir}/usr/share/applications/"
    cp -r --no-preserve=mode,ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
