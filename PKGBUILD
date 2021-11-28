_name='papirus-icon-theme'
pkgname="${_name}-stripped"
pkgver=20211101
pkgrel=1
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
sha512sums=('13b8e0624d1cb0a39f5dbb407682766de942a31a19b683ca1429dc9c97b4f236e070176f1a5e6f37893d0587276d37c6b8e3cee2bea72bf535598ea84704f717')

prepare() {
    cd "${srcdir}"
    tar xf "${_archive}" "${_snapshot}/Papirus" "${_snapshot}/Papirus-Dark" "${_snapshot}/LICENSE"
}

package() {
    cd "${srcdir}/${_snapshot}"

    install -dm755 "${pkgdir}/usr/share/icons" && cp -rt "$_" "Papirus" "Papirus-Dark"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
