# Maintainer: mmoya <mmoya at mmoya dot org>

_pkgname=nym-connect
pkgname="${_pkgname}-appimage"
pkgver=1.1.21
_pkgvername=kitkat
pkgrel=2
pkgdesc="Nym Connects sets up a SOCKS5 proxy for local applications to use."
arch=('x86_64')
url="https://github.com/nymtech/nym"
license=('Apache 2.0')
depends=('webkit2gtk')
options=(!strip)
_filename="${_pkgname}_${pkgver}_amd64.AppImage"
source_x86_64=("https://github.com/nymtech/nym/releases/download/nym-connect-v${pkgver}-${_pkgvername}/${_filename}")
sha256sums_x86_64=(ebc756e12037a6a3a274d9d5e16e53b042e4f1b785db17ecaf81c1e7a55f86a2)

package() {
    chmod +x ${_filename}
    ./${_filename} --appimage-extract "nym-connect.desktop" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/bin/nym-connect" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/nym-connect.png" >/dev/null 2>&1

    install -Dm644 "squashfs-root/nym-connect.desktop" "${pkgdir}/usr/share/applications/nym-connect.desktop"

    install -Dm755 "squashfs-root/usr/bin/nym-connect" "${pkgdir}/usr/bin/nym-connect"
    chmod 755 "${pkgdir}/usr/bin"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/share/icons" -type f -name "nym-connect.png" -exec chmod 644 {} \;
}
