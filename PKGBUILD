pkgname=papirus-icon-theme-stripped
pkgver=20221201
pkgrel=1
pkgdesc="Papirus icon theme, stripped to only base (default + dark) variations."
_name="${pkgname%-*}"
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
sha256sums=('798d4f4274a60e47a34cbf590b9084263e999f445087462fa8adc9b951029618')

package() {
    local icons="${pkgdir}/usr/share/icons"
    local licenses="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${icons}" "${licenses}"

    tar -C "${icons}" --strip-components=1 --no-same-owner --no-same-permissions \
        -xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark"

    tar -C "${licenses}" --strip-components=1 --no-same-owner --no-same-permissions \
        -xf "${_archive}" "${_snapshot}/LICENSE"
}
