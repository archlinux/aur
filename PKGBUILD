# Maintainer: Pierre-Alexis Ciavaldini <pierre-alexis@ciavaldini.fr>

# maintenance, tar files
pkgver="1.1.0"
pkgrel=1
sha256sums=(
    # tar.gz
    "11e4dda02398fdcdc04999dac27dc42263a29480f977ab8411d4c2b23c74b0b0"
    # Particl Desktop.desktop -> change version
    "a426d46f17a0b17e7a4db7186b1e94fad368e27c5437d13496a2a880cad87fa4"
    # icon.png
    "24054a6942768b71baf6ccecd9b6b4e965ca5b478bc684feb8d35e1d18f2ccab"
)

# info
pkgname="particl-bin"
pkgdesc="Particl Desktop from git releases"

_name="particl-desktop"
_platform="linux-x64"
_package="${_name}-${pkgver}-${_platform}"
arch=('x86_64')
license=('GPL')
url="https://github.com/particl/particl-desktop/releases"

provides=(
    ${_name}
)
conflicts=(
    'particl-git'
)
depends=()

# desktop file and icon
source=(
    "${url}/download/v${pkgver}/${_package}.tar.gz"
    "Particl Desktop.desktop"
    "icon.png"
)

package() {

    # create directories
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications"

    # install       FROM                      TO
    cp -a "${srcdir}/${_package}/" "${pkgdir}/opt/${_name}/"
    ln -s "/opt/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"

    # installing icon and desktop file
    cp "${srcdir}/icon.png"                "${pkgdir}/opt/${_name}/"
    cp "${srcdir}/Particl Desktop.desktop" "${pkgdir}/usr/share/applications"

    # modes
    find      "${pkgdir}" -type d -exec chmod 755 {} +
    find      "${pkgdir}" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/opt/${_name}/${_name}"
    chmod 755 "${pkgdir}/opt/${_name}/libnode.so"
    chmod 755 "${pkgdir}/opt/${_name}/libffmpeg.so"
}
