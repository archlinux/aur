# Maintainer: Gustav Åkerström 23389010+gustavakerstrom@users.noreply.github.com

pkgname=partydeck-bin
_pkgname="${pkgname/-bin/}"
pkgver=0.8.6
pkgrel=1
pkgdesc='A split-screen game launcher for Linux/SteamOS. Pre-compiled.'
arch=('x86_64')
url='https://github.com/partydeck/partydeck'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('umu-launcher' 'bubblewrap')
optdepends=('fuse-overlayfs' 'gamescope')

source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('111f45f7cba813755c5c48ca073dd217e869b0a57ebcd89c756c20ea79ad4c73')

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"

    install -Dm755 "bin/gamescope-kbm" "${pkgdir}/opt/${_pkgname}/bin/gamescope-kbm"
    cp -a res "${pkgdir}/opt/${_pkgname}/"

    install -d "${pkgdir}/usr/bin"

    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
    install -Dm644 thirdparty.txt "${pkgdir}/usr/share/licenses/${_pkgname}/THIRDPARTY"
}
