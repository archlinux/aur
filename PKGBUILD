# Maintainer: Pierre-Alexis Ciavaldini <pierre-alexis@ciavaldini.fr>

# maintenance, files checksums
pkgver="3.1.3"
pkgrel=1
sha256sums=(
    # .zip linux-x64
    "d4adb005557b971574d22ce29dcb3847ed6d2f391046c310aa662d0f1f65aac9"
    # Particl Desktop.desktop -> change version
    "3fee1b62d18816680f7672af1ad7cce56bfa9c5529bafba7c528ec3ec136b691"
    # icon.png
    "3916932f864c13e916cb940a3398656bc236afd2e4a5b188ff717e749b8aa851"
)

# info
pkgname="particl-bin"
pkgdesc="Particl Desktop from git releases"

_name="particl-desktop"
_app_name="Particl Desktop"
_platform="linux-x64"
_package="${_name}-${pkgver}-${_platform}"
arch=('x86_64')
license=('GPL')
url="https://github.com/particl/${_name}/releases"

provides=(
    ${_name}
)
conflicts=(
    'particl-git'
)
depends=()

# desktop file and icon
source=(
    "${url}/download/v${pkgver}/${_package}.zip"
    "${_app_name}.desktop"
    "icon.png"
)

package() {

    # create directories
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications"

    # remove unwanted package in package
    rm "${srcdir}/${_package}.zip"

    #                FROM                             TO
    cp -a "${srcdir}/"                     "${pkgdir}/opt/${_name}/"
    ln -s "/opt/${_name}/${_app_name}"     "${pkgdir}/usr/bin/${_app_name}"
    cp    "${srcdir}/${_app_name}.desktop" "${pkgdir}/usr/share/applications"

    # modes
    find       "${pkgdir}" -type d -exec chmod 755 {} +
    find       "${pkgdir}" -type f -exec chmod 644 {} +
    chmod 755  "${pkgdir}/opt/${_name}/${_app_name}"
    chmod 755  "${pkgdir}/opt/${_name}/libEGL.so"
    chmod 755  "${pkgdir}/opt/${_name}/libffmpeg.so"
    chmod 755  "${pkgdir}/opt/${_name}/libGLESv2.so"
    chmod 4755 "${pkgdir}/opt/${_name}/chrome-sandbox"
}
