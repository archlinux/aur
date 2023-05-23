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
pkgver=232.6095.13
pkgrel=1
_eapver=2023.2
_eaprelease=2
epoch=1
pkgdesc="A cross-platform .NET IDE by JetBrains."
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/rider/eap/"
license=("custom")
optdepends=('mono: .NET runtime' 'msbuild: build .NET Core projects')

source=("https://download-cdn.jetbrains.com/rider/JetBrains.Rider-${_eapver}-EAP${_eaprelease}-${pkgver}.Checked.tar.gz"
        "${pkgname}.desktop")
sha256sums=('b7e5d3e4ef722dbd4e9be3a3db11243ef76312738e0e51236d3fde3b944dbbd4'
            'cbb7c9b847c92c95403be237ab01183eb0516b4a9b46c8ba27c87243fed8cbb8')

package() {
    # create the target folders
    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/bin/" "${pkgdir}/opt/"

    # install the package content
    cp -rdp --no-preserve=ownership "./JetBrains Rider-${pkgver}/" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    ln -s "/opt/${pkgname}/bin/rider.sh" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/${pkgname}/license" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
