# Maintainer: she11sh0cked <22623152+she11sh0cked@users.noreply.github.com>

pkgname=pascom-onsite-client
pkgver=93.R2749
pkgrel=1
pkgdesc="Pascom Onsite Client"
arch=('x86_64')
url="https://www.pascom.net/"
license=('custom: commercial')
optdepends=('xcb-util-cursor: Needed for mouse cursor support under X11')
source=(
    "pascom_Client-${pkgver}.tar.bz2::https://my.pascom.net/update/client/stable/linux"
    "${pkgname}.desktop"
)

sha256sums=(
    "8980dccf9b780a1eae19b7ac6e3aaa472aa1edc86ce91bf2ab7be1d52d50c232"
    "61dd295f1ada26fb6289766bd750b09dce1c397ad5693328ce88154fab44091c"
)

pkgver() {
    IFS='/' read -ra ADDR <<<$(curl -ILs -o /dev/null -w %{url_effective} https://my.pascom.net/update/client/stable/linux)
    echo ${ADDR[6]} | sed 's/pascom_Client.//g' | sed 's/.tar.bz2//g'
}

package() {
    _pkg=pascom_Client

    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"

    install -m644 "${srcdir}/${_pkg}/client.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${pkgname}" -R
}
