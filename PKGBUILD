pkgname=papirus-icon-theme-stripped
pkgver=20220808
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
sha256sums=('79885ffa464734a49ee73e60eaf78a0cf9c7d2cf310664a8b7c5c90c403644b1')

package() {
    local icons="${pkgdir}/usr/share/icons"
    local licenses="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${icons}" "${licenses}"

    cd "${srcdir}"

    tar -C "${icons}" --strip-components=1 --no-same-owner --no-same-permissions \
        -xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark"

    tar -C "${licenses}" --strip-components=1 --no-same-owner --no-same-permissions \
        -xf "${_archive}" "${_snapshot}/LICENSE"
}
