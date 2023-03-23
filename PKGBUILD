# Maintainer: Christian Heusel <christian (at) heusel (dot) eu>
# Contributor: jonathanh
# Contributor: dszryan
# Contributor: Bryce Beagle <first dot last at gmail dot com>
# Contributor: Giampaolo Mancini <mancho at trmpln dot com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=rider-eap
pkgver=231.8109.136
pkgrel=1
_eapver=2023.1
_eaprelease=9
epoch=1
pkgdesc="A cross-platform .NET IDE by JetBrains."
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/rider/eap/"
license=("custom")
optdepends=('mono: .NET runtime' 'msbuild: build .NET Core projects')
provides=("rider")
conflicts=("rider")
groups=("development" "IDE" "editor" "jetbrains")

source=("https://download-cdn.jetbrains.com/rider/JetBrains.Rider-${_eapver}-EAP${_eaprelease}-${pkgver}.Checked.tar.gz"
        "${pkgname}.desktop"
        "ResharperHost-runtime-folder.sh")
sha256sums=('11d0213f6cf1d6f6e8415057a7b32fdef86289866e1e2ee9863caa672b165a9e'
            'ada362803d6d2b5ff84680277694d0ecdcb97d46f85d140f79850500966f1ecf'
            '4bc086ff245cf18c5fd2351008b05a0d0e792e8af0394fb094a9118c312c373d')

package() {
    cd "${srcdir}"
    # create the target folders
    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/bin/" "${pkgdir}/opt/"

    # install the package content
    cp -rdp --no-preserve=ownership "${srcdir}/JetBrains Rider-${pkgver}/" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/rider.desktop"

    ln -s "/opt/${pkgname}/bin/rider.sh" "${pkgdir}/usr/bin/rider"
    ln -s "/opt/${pkgname}/license" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
