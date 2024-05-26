# Maintainer: gigas002 <gigas002@pm.me>

pkgname=poi-nightly-bin
_pkgname=poi
_releasever=11.0.0-beta.6
_buildver=8487
_pkgver="${_releasever}.${_buildver}"
pkgver="11.0.0.beta.6.${_buildver}"
pkgrel=2
pkgdesc="Scalable KanColle browser and tool"
arch=('x86_64')
url="https://github.com/poooi/poi/"
license=('MIT')
provides=("poi")
depends=('nss' 'gtk3')
conflicts=('poi')
options=(!strip)
source=("${_pkgname}-${_pkgver}.7z::https://nightly.poi.moe/$_buildver/${_pkgname}-${_releasever}.7z"
        "https://raw.githubusercontent.com/poooi/poi/master/assets/icons/icon.png"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
noextract=("${_pkgname}-${_pkgver}.7z")
sha256sums=('64c0c550ff9237ddee38f626153d370a800b8fa09cdf99d7b08a596726739d15'
            '7f58b9f7918da59bf8003f9d2345eb0f0700b7cfcb3c07ef17a171e3f08fe3f8'
            '64bb9cea2afcc47870902c960082c267715d8f88314dd0dd4249a00eac5a07ab'
            'b08d1eb63de3af0c67860fd8bfd709d492ac600eef9c0cd52e2ee65e5ab69194')

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
    bsdtar -xf "${_pkgname}-${_pkgver}.7z" -C "${pkgdir}/opt/${_pkgname}/"
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Install pixmap and desktop files
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/poi_icon.png"
    install -Dm644 -t "${pkgdir}/usr/share/applications" poi.desktop
}
