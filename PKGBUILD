# Maintainer: she11sh0cked <22623152+she11sh0cked@users.noreply.github.com>

pkgname=pascom-client
pkgver=106.R3601
pkgrel=2
pkgdesc="Pascom Client"
arch=('x86_64')
url="https://www.pascom.net/"
license=('custom: commercial')
optdepends=('xcb-util-cursor: Needed for mouse cursor support under X11')
source=(
    "pascom_Client-${pkgver}-linux.tar.bz2::https://my.pascom.net/update/client/cloud/linux"
    "${pkgname}.desktop"
)

sha256sums=(
    "c7acfa3851a2877326900f5101217880f183ac8b088151d09c583e8942794579"
    "c59ab91a5cb239d50bc35f21bc884c1dfb3a4e1b6ce3c2478bc229f56c83dc15"
)

pkgver() {
    IFS='/' read -ra ADDR <<<$(curl -ILs -o /dev/null -w %{url_effective} https://my.pascom.net/update/client/cloud/linux)
    echo ${ADDR[6]} | sed 's/pascom_Client.//g' | sed 's/.linux.tar.bz2//g'
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
