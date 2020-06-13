# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Stefan Reisinger <dev at stefan-reisinger dot at>

pkgname=manictime-bin
_pkgname=manictime
pkgver=1.2.2
_pkgver=1_2_2_0
pkgrel=1
pkgdesc='ManicTime automatically records your computer usage.'
arch=('x86_64')
url="https://www.manictime.com/linux/download"
license=('custom:commercial')
depends=('mono' 'libxss' 'libappindicator-gtk3')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://cdn.manictime.com/setup/linux/v${_pkgver}/ManicTime.tar.gz"
    'manictime.desktop'
)
sha256sums=('471ca9653ba189475cdfa8299ca8a3e9c466427f1084891271dd0d6bc29fcbca'
            'a93303d5320cc2678a7643a4320b61d3b9577080cfdfae2055f9a4534c65c230')

package() {
    install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"

    install -m644 "${srcdir}/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -m644 "${srcdir}/${_pkgname}/Resources/ManicTime.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
    
    cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}" -R
    rm "${pkgdir}/opt/${_pkgname}/ManicTimeTrackerSettings.json"
    ln -s "/opt/${_pkgname}/manictime" "${pkgdir}/usr/bin/manictime"
}
