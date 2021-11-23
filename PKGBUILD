# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname="openutau"

pkgname="${_pkgname}"
pkgver=0.0.517
pkgrel=5
pkgdesc="Open source UTAU successor"
arch=('x86_64')
url="https://github.com/stakira/OpenUtau"
license=('MIT')
depends=('fuse2' 'fuse3' 'fuse-common')
_appimage="OpenUtau-prerelease-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/stakira/OpenUtau/releases/download/OpenUtau-Latest/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('571824f765a566105cebac63de4242633c9041045e2e2943a3a9b49c2af9b0c5')
options+=('!strip')

prepare() {
    chmod +x "${_appimage}"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
    # Desktop file
    install -Dm644 "${srcdir}/../${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
