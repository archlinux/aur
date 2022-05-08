pkgname=papirus-icon-theme-stripped
pkgver=20220508
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
sha256sums=('0b17c824de8498dae0e2a0e27d24bf79f42eae4041003b509decb2c1ec69d8db')

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/icons" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/LICENSE"
}
