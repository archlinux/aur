# Contributor: gryffyn <me@gryffyn.io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=archiveweb.page-appimage
pkgver=0.17.1
pkgrel=1
pkgdesc="An Electron based application for interactive, high-fidelity web archiving"
arch=('x86_64')
url="https://github.com/webrecorder/archiveweb.page"
license=('AGPL-3.0-or-later')
depends=('fuse2' 'glibc' 'hicolor-icon-theme' 'zlib')
options=(!strip)
source=("${url}/releases/download/v${pkgver}/ArchiveWeb.page-${pkgver}.AppImage"
        "ArchiveWeb.page.desktop")
sha256sums=('a840308bf35211a3a267436e21665bb58b24ce9f6060379aec4c5fc8e1f76a6c'
            'c4719dda47e010dc9ad4dbe191b823acca6e9f74f7d28380215517c109990c2c')

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
