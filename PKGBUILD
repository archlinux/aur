# Maintainer: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>
# Upstream: Immersed Inc. <info at immersed dot com>
pkgname=immersed
pkgver=9.8
pkgrel=1
pkgdesc="Immersed Desktop Agent"
arch=("x86_64")
url="https://immersed.com/"
license=('unknown')
makedepends=("gendesk")
depends=("fuse")
optdepends=('V4L2LOOPBACK-MODULE: Virtual webcam support')
options=(!strip)
_appimage="Immersed-x86_64.AppImage"
_icon="${pkgname}.png"
source_x86_64=("${_appimage}::https://static.immersed.com/dl/Immersed-x86_64.AppImage" "${_icon}::https://immersed.com/assets/favicon/android-icon-192x192-202d04a8c19d3974616bc5dd9136796dbc04f4c10a4b32277d5eeb0d22e846b0.png")
noextract=("${_appimage}")
md5sums_x86_64=('86145b83b81bc33b13434a86a3739b6f'
                SKIP)

prepare() {
    gendesk -f -n --name="Immersed" --pkgname=${pkgname} --pkgdesc=${pkgdesc} --exec=${pkgname} --icon=${srcdir}/${_icon}
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop entry
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${_icon}" "${pkgdir}/usr/share/icons/${_icon}"
}
