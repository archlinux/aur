pkgname=papirus-icon-theme-stripped
pkgver=20220910
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
sha256sums=('e236c96bc53105770029718158353adb79e76b18f2847ac1bb5dc5e87b09e22e')

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
