# Maintainer: jmcb <joelsgp@protonmail.com>
# Contributor: Marc Mettke <mettke@itmettke.de>

pkgname='jetbrains-mps'
pkgver='2022.3'
pkgrel=1
pkgdesc="JetBrains Meta Programming System"
arch=('any')
url="http://www.jetbrains.com/mps/index.html"
license=('custom: MPS license agreement')
depends=('java-environment=17' 'libxslt' 'gtk2' 'libglvnd' 'libxtst' 'alsa-lib' 'python')
optdepends=('ffmpeg0.10: support for multimedia plugin')
makedepends=('imagemagick')
source=("https://download.jetbrains.com/mps/${pkgver}/MPS-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('6a8640ef9613fa562513788ae33d66c535ec230564d000cea61f7684a2f4042b'
            '6a6b1f8f43ba07cd0428f9fc755d56962e4ca0c1257d5a57b126121e16f1f56a')

package() {
    _dest="opt/${pkgname}"
    _opt="${pkgdir}/${_dest}"
    _bin="${pkgdir}/usr/bin/"
    _share="${pkgdir}/usr/share/"

    # todo symlink mps.sh to bin/mps
    # todo pixmap

    # main files
    install -d "${pkgdir}/opt"
    cp -r "MPS ${pkgver}" "${_opt}"

    # desktop entry
    install -D -m 644 "${pkgname}.desktop" "${_share}/applications"

    install -D "${_opt}/bin/mps.svg" "${_share}/pixmaps/${pkgname}.svg"
    install -d "${_share}/pixmaps/"
    convert -background none "${_opt}/bin/mps.svg" "${_share}/pixmaps/${pkgname}.png"

    # license symlink
    _license="${_share}/licenses/${pkgname}"
    install -d "${_license}"
    ln -s "/${_dest}/license/mps_license.txt" "${_license}"
}
