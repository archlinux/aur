_name='papirus-icon-theme'
pkgname="${_name}-stripped"
pkgver=20220204
pkgrel=1
pkgdesc="Papirus icon theme, stripped to only base (default + dark) variations."
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
sha512sums=('e85a9f3fa2564fb6404205695c9500baf54d37c7c03288d086c2bdff5b722d8eae8b283bab0658eebd1760e8bbe4bd1875958f68b065611cb761e4c2c08b1079')

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/icons" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/LICENSE"
}
