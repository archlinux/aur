# Maintainer: yumi

pkgname=shvspy-bin
pkgver=1.16.7
pkgrel=1
pkgdesc="SHV Spy (AppImage)"
arch=('x86_64')
url="https://github.com/silicon-heaven/shvspy"
license=('MIT')
depends=('glibc')
provides=('shvspy')
conflicts=('shvspy')
options=(!strip)

_appimage="shvspy-qt6-${pkgver}.AppImage"

source=(
    "${_appimage}::https://github.com/silicon-heaven/shvspy/releases/download/${pkgver}/${_appimage}"
    "shvspy.png"
    "shvspy.desktop"
)

sha256sums=('2eb9f7edecc4f98e17748e6af4c286a6b9574b0c8303b44a9dd40c6c223e2043'
            '785183a3abf7d60bc1e37a4661cddcd2dbcf8451e465c83f705c6df007116fc4'
            '78fb4ff4cef729f40d6729bb8f7788868e26d41dd6d26feddbfebb7a958dcb1c')

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/shvspy.AppImage"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/shvspy.AppImage" \
        "${pkgdir}/usr/bin/shvspy"

    install -Dm644 "${srcdir}/shvspy.png" \
        "${pkgdir}/usr/share/pixmaps/shvspy.png"

    install -Dm644 "${srcdir}/shvspy.desktop" \
        "${pkgdir}/usr/share/applications/shvspy.desktop"
}
