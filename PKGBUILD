pkgname=papirus-icon-theme-stripped
pkgver=20220710
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

source=("${_archive}::${url}/archive/${pkgver}.tar.gz")
noextract=("${_archive}")
sha256sums=('9aa81b51b73bfafeae7dbf7ef411db7c74fcff983e4b13c0e05e481dc65971b2')

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/icons" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/LICENSE"
}
