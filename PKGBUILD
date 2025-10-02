# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=uvtools-bin
_pkgname="${pkgname%-bin}"
pkgver=5.2.1
pkgrel=1
pkgdesc="MSLA/DLP, file analysis, calibration, repair, conversion and manipulation"
arch=('x86_64')
url="https://github.com/sn4k3/UVtools"
license=('AGPL3')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('zlib' 'fuse' 'openjpeg2' 'libjpeg-turbo' 'libpng' 'libgeotiff' 'libdc1394' 'ffmpeg' 'openexr' 'tbb' 'libgdiplus')
options=('!strip' '!debug')
_appimage="UVtools_linux-x64_${pkgver}.AppImage"
noextract=("${_appimage}")
source_x86_64=(
    "${_appimage}::${url}/releases/download/v${pkgver}/UVtools_linux-x64_v${pkgver}.AppImage"
)
sha256sums_x86_64=('2df782f096a681acab1828ad3d80b1208d875c9f455c859188d744e9cc3a2633')

prepare() {
    chmod +x ${srcdir}/${_appimage}
}

package() {
    # Install AppImage
    install -Dm 755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${_pkgname}/${_appimage}"
    # Symlink executable
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
