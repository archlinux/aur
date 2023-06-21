# Maintainer: jmcb <joelsgp@protonmail.com>
# Contributor: Marc Mettke <mettke@itmettke.de>

pkgname='jetbrains-mps'
pkgver='2022.3'
pkgrel=1
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
# idk about these lol
depends=('java-environment=17' 'libxslt' 'gtk2' 'libglvnd' 'libxtst' 'alsa-lib' 'python')
optdepends=('ffmpeg0.10: support for multimedia plugin')
makedepends=('imagemagick')
source=("https://download.jetbrains.com/mps/${pkgver}/MPS-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('6a8640ef9613fa562513788ae33d66c535ec230564d000cea61f7684a2f4042b'
            '4f12761b77b311b52c46be3519a4468f15bed82045670b5d238a5019f1dae2e1')

package() {
    _dest="opt/${pkgname}"
    _opt="${pkgdir}/${_dest}"
    _bin="${pkgdir}/usr/bin/"
    _share="${pkgdir}/usr/share/"

    # main files
    install -d "${pkgdir}/opt"
    cp -r "MPS ${pkgver}" "${_opt}"

    # desktop entry
    install -D -m 644 -t "${_share}/applications" "${pkgname}.desktop" 

    install -D "${_opt}/bin/mps.svg" "${_share}/pixmaps/${pkgname}.svg"
    install -d "${_share}/pixmaps/"
    convert -background none "${_opt}/bin/mps.svg" "${_share}/pixmaps/${pkgname}.png"

    # binary symlink
    install -d "${_bin}"
    ln -s "/${_dest}/bin/mps.sh" "${_bin}/${pkgname}"

    # license symlink
    _license="${_share}/licenses/${pkgname}"
    install -d "${_license}"
    ln -s "/${_dest}/license/mps_license.txt" "${_license}"
}
