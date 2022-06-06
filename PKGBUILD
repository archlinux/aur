pkgname=papirus-icon-theme-stripped
pkgver=20220606
pkgrel=1
pkgdesc="Papirus icon theme, stripped to only base (default + dark) variations."
_name="${pkgname%-stripped}"
url="https://github.com/PapirusDevelopmentTeam/${_name}"
arch=('any')
license=('GPL3')
provides=("${_name}")
conflicts=("${_name}")
options=('!strip' '!emptydirs')

_snapshot="${_name}-${pkgver}"
_archive="${_snapshot}.tar.gz"

source=("${_archive}::${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=("${_archive}")
sha256sums=('139d18bada63d72779f2b604dbe893987d74000de728165ef1cb8baa4624b9c6')

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/icons" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/LICENSE"
}
