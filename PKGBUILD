# Maintainer: Nestor Cagnoli <nestor[DOT]cagnoli[at]gmail[DOT]com>
pkgname=cura-51-beta
_pkgname=cura-51-beta
_shortname=cura51
pkgver=5.1.0
pkgrel=0
pkgdesc='Uncompressed beta version of Ultimaker Cura 5.1'
arch=('x86_64')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL3')
depends=('fuse2' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk')
provides=('cura')
options=(!strip)
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=(
    "${_pkgname}.AppImage::https://github.com/Ultimaker/Cura/releases/download/5.1.0/Ultimaker-Cura-5.1.0-linux.AppImage"
    "${_shortname}.sh"
)

sha256sums=(
    "SKIP"
    "fc237589ff9849439e22512b81b6a2efc09450f4785d0cadf802663865923035"
)
   
prepare() {
    cd "${srcdir}"
    chmod +x $PWD/${_pkgname}.AppImage
    $PWD/${_pkgname}.AppImage --appimage-extract 1>>/dev/null 2>>/dev/null
    mv squashfs-root ${_shortname}
    cd ${_shortname}
    # Simplify life
    cp /usr/lib/libstdc++* $PWD
    cp /usr/lib/librsvg-2.so* $PWD
}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -rf "${srcdir}/${_shortname}" "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/bin/"
    cp -f "${srcdir}/cura51.sh" "${pkgdir}/usr/bin/${_shortname}"
}
