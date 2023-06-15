
pkgname=electerm-bin-electron
pkgver=1.25.50
pkgrel=1
pkgdesc="An electron-based SSH/SFTP Connection manager and terminal. Using the system electron"
arch=("any")
url="https://electerm.html5beta.com"
license=("MIT")
depends=(
    "nss"
    "electron18"
)
optdepends=()
_pkgname="electerm"
provides=('electerm')
conflicts=('electerm')
source=(
	"https://github.com/electerm/electerm/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
	"https://raw.githubusercontent.com/electerm/electerm/master/LICENSE"
        "${_pkgname}.desktop"
        "https://github.com/electerm/electerm-resource/raw/master/res/imgs/electerm-round-128x128.png"
        "${_pkgname}"
)

sha256sums=('576852357e53c242a3f9be2c4bfee2079240d57ee813faa49e9463905914d5fa'
            'b6d96207cff171127c04f59f9eb545b575b71cd93ebc355247cad63e23ca500d'
            '932fdf612b1c77487484e40ea47d1e356e08e8f3e305c69a6c9e2fdc5bfc7104'
            '06188f81a5a96af1738af57c17f119538264f117f72ef602e946871fa738034a'
            'ebef199f25decfc78c252af769099f7e5506dac06d9e07557d6a365508f8408a')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-linux-x64" || exit 2
    install -Dm644 "${srcdir}/electerm-round-128x128.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "resources/app.asar" "${pkgdir}/usr/share/${_pkgname}/app.asar"
    cp -r "resources/app.asar.unpacked" "${pkgdir}/usr/share/${_pkgname}/"
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_pkgname}.desktop"
}
