_name='papirus-icon-theme'
pkgname="${_name}-stripped"
pkgver=20211201
pkgrel=2
pkgdesc="Papirus icon theme, stripped to only base variations."
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
sha512sums=('746055e9db0ef11c996fd90892582ca5ffd3e7c77aa08a43de2dd162364e915c73b3e1ab139c8caa4295e0857b4b5a6e273606f41ae5ab91de9dd160598ec621')

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/usr/share/icons" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}" &&
        tar -C "$_" --strip-components=1 --no-same-owner --no-same-permissions \
            -xf "${_archive}" "${_snapshot}/LICENSE"
}
