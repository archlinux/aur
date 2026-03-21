# Maintainer: Lucas Schwiderski <lucas@lschwiderski.de>
pkgname=seadrive-cli
pkgver=3.0.20
pkgrel=1
pkgdesc="The Seafile Drive client enables you to access files on the server without syncing to local disk. It works like a network drive."
arch=('x86_64')
url="https://www.seafile.com/"
license=('Apache-2.0')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=('!strip')

_appimage="SeaDrive-cli-${CARCH}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://sos-ch-dk-2.exo.io/seafile-downloads/${_appimage}")
sha256sums_x86_64=('47c6c210083a29d4a7f0a0305bcae1fe7143e95353ef799b6ca295a548f11638')

prepare() {
    chmod +x "${_appimage}"
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname%-cli}"
}
