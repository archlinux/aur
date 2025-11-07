# Contributor: gryffyn <me@gryffyn.io>
# Maintainer: tee < teeaur at duck dot com >

pkgname=archiveweb.page-appimage
pkgver=0.15.8
pkgrel=1
pkgdesc="An Electron based application for interactive, high-fidelity web archiving"
arch=('x86_64')
url="https://github.com/webrecorder/archiveweb.page"
license=('AGPL-3.0-only')
depends=('fuse2'
         'hicolor-icon-theme'
         'zlib')
source=("${url}/releases/download/v${pkgver}/ArchiveWeb.page-${pkgver}.AppImage"
        "ArchiveWeb.page.desktop")
sha256sums=('6b3147d76ac185f18a63c8a705a382bfd1f651e9bd34cc170f9d3044dd42fe38'
            '62b378eaad8f542f85c8c0a90b6ab6f9bec8f48d0924eb0cafb1521403573cb1')

prepare() {
    sed -i "s/{pkgversion}/${pkgver}/" ${srcdir}/ArchiveWeb.page.desktop

    chmod +x "${srcdir}/ArchiveWeb.page-${pkgver}.AppImage"
    "${srcdir}/ArchiveWeb.page-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/ArchiveWeb.page-${pkgver}.AppImage" "${pkgdir}/opt/ArchiveWeb.page/ArchiveWeb.page.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/ArchiveWeb.page/ArchiveWeb.page.AppImage "${pkgdir}/usr/bin/ArchiveWeb.page"

    install -dm755 "${pkgdir}/usr/share/applications/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    cp --no-preserve=mode,ownership "${srcdir}/ArchiveWeb.page.desktop" "${pkgdir}/usr/share/applications/"
}
