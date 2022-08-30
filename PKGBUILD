pkgname=webcord-bin
pkgver=3.8.1
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron."
arch=('x86_64')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
_name="${pkgname%-bin}"
provides=("${_name}")
conflicts=("${_name}")
options=('!emptydirs')

_archive="webcord-${pkgver}-1.x86_64.rpm"

source=("${_archive}::${url}/releases/download/v${pkgver}/${_archive}")
sha256sums=('0adfa4a162233ca3f3a5c393f1e34427f06a2ab6e087e42092990a32a59ffcce')
noextract=("${_archive}")

package() {
    cd "${srcdir}"

    bsdtar -xf "${_archive}" \
        -C "${pkgdir}" \
        --exclude="usr/lib/.build-id" \
        --exclude="usr/bin"

    local bin="${pkgdir}/usr/bin"
    local licenses="${pkgdir}/usr/share/licenses"
    install -dm755 "${bin}" "${licenses}"

    mv "${pkgdir}/usr/lib" "${pkgdir}/opt"
    mv "${pkgdir}/usr/share/doc/${_name}" "${licenses}/${pkgname}"
    ln -s "/opt/${_name}/${_name}" "${bin}/${_name}"
}
