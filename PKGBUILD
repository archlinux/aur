_name=papirus-icon-theme
pkgname=${_name}-stripped
pkgver=20230104
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

source=("${_archive}::${url}/archive/${pkgver}.tar.gz")
noextract=("${_archive}")
sha256sums=('a3e91076f41bd01c754237c9f8339d1c02e286c00998f86be471ffc280542d28')

package() {
    local icons="${pkgdir}/usr/share/icons"
    local licenses="${pkgdir}/usr/share/licenses/${pkgname}"
    install -dm755 "${icons}" "${licenses}"

    tar -C "${icons}" --strip-components=1 --no-same-owner --no-same-permissions \
        -xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark"

    tar -C "${licenses}" --strip-components=1 --no-same-owner --no-same-permissions \
        -xf "${_archive}" "${_snapshot}/LICENSE"
}
