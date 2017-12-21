# Maintainer: Pierre-Alexis Ciavaldini <pierre-alexis@ciavaldini.fr>

# maintenance, tar files
pkgver="1.0.0"
pkgrel=1
sha256sums=(
    # tar.gz
    "f2487f8bcc78dabeeac00a19b97db047cc5304486c432a50449cb65d43a875b3"
    # Particl.desktop -> change version
    "6c4af3e9a51464395d1d477071f95c25e78ff603d11aa5614b10f82c116fca23"
    # icon.png
    "24054a6942768b71baf6ccecd9b6b4e965ca5b478bc684feb8d35e1d18f2ccab"
)

# info
pkgname="particl-bin"
_binname="particl"
pkgdesc="Particl Wallet from git releases"
arch=('x86_64')
license=('GPL')
url="https://github.com/particl/partgui/releases"

provides=(
    ${_binname}
)
conflicts=(
    'particl-git'
)
depends=(
)

# desktop file and icon
source=(
    "${url}/download/v${pkgver}/particl-${pkgver}-linux.tar.gz"
    "Particl.desktop"
    "icon.png"
)

package() {

    # create directories
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications"

    # install            FROM                            TO
    cp -a "${srcdir}/${_binname}-${pkgver}/" "${pkgdir}/opt/${_binname}/"
    ln -s "/opt/${_binname}/${_binname}"     "${pkgdir}/usr/bin/${_binname}"

    # installing desktop file and icon
    cp "${srcdir}/icon.png"        "${pkgdir}/opt/${_binname}/"
    cp "${srcdir}/Particl.desktop" "${pkgdir}/usr/share/applications"

    # modes
    find      "${pkgdir}" -type d -exec chmod 755 {} +
    find      "${pkgdir}" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/opt/${_binname}/${_binname}"
    chmod 755 "${pkgdir}/opt/${_binname}/libnode.so"
    chmod 755 "${pkgdir}/opt/${_binname}/libffmpeg.so"
}
