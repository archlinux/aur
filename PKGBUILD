# Maintainer: Teddy Rodrigues Valette <teddy@valette.xyz>

pkgname=keylight-controller
pkgver=1.3.0
pkgrel=1
pkgdesc="Standalone Linux alternative to Elgato's Control Center for Controlling Key Light devices."
url=https://github.com/sandwichfarm/keylight-control
arch=('x86_64')
license=('GPL-3.0-only')
options=('!debug')

githubuser=sandwichfarm
githubrepo=keylight-control

source=(${pkgname}.desktop.upstream::https://raw.githubusercontent.com/${githubuser}/${githubrepo}/refs/tags/v${pkgver}/${pkgname}.desktop)
source_x86_64=(https://github.com/${githubuser}/${githubrepo}/releases/download/v${pkgver}/${pkgname}-linux-x64.tar.gz)

sha256sums=('6341d774dc3af2fa96805273d3854e29c9ce7713806a37f25a38f3f17fd9b2ae')
sha256sums_x86_64=('5cf0ca308a61eb547a287892ab12e494fd9f96f890f9b93904fea90b8e349e65')

prepare() {
    sed "s|Exec=python3 .*|Exec=/usr/bin/${pkgname}|g" "${srcdir}/${pkgname}.desktop.upstream" |\
    sed '/^Path=.*/d' > "${srcdir}/${pkgname}.desktop"
}

package() {
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/bin"

    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
