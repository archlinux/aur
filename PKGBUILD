# Maintainer: Tobiichi-Origuchi <tobiichioriguchi@gmail.com>

pkgname=pixez-bin
_pkgname=pixez
pkgver=0.9.114
pkgrel=1
pkgdesc="Pixiv third-party client written in Flutter"
arch=('x86_64')
url="https://github.com/Notsfsssf/pixez-flutter"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source_x86_64=(
    "${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/Notsfsssf/pixez-flutter/releases/download/${pkgver}/linux-x86_64-release.tar.gz"
    "com.perol.pixez.desktop"
)
sha256sums_x86_64=(
    'e63fe9378d26fc9821be0d6bb1bf98cb21a81a7e39e1aaab98e06831b02f870a'
    '5fdaf6fc794b119cabf91836976b1f75c43128adce3d32ee0b6be0281b3b438e'
)

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"

    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
    cp -r "${srcdir}/lib" "${pkgdir}/opt/${_pkgname}/"
    cp -r "${srcdir}/data" "${pkgdir}/opt/${_pkgname}/"

    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/data/flutter_assets/assets/images/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/com.perol.pixez.desktop" \
        "${pkgdir}/usr/share/applications/com.perol.pixez.desktop"
}
