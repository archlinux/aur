# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=time-to-leave-bin
pkgver=2.0.1
pkgrel=2
pkgdesc="Log work hours and get notified when it's time to leave the office and start to live."
arch=('x86_64')
url="http://timetoleave.app/"
_githuburl="https://github.com/thamara/time-to-leave"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(libxcomposite 'alsa-lib' 'gcc-libs' 'pango' 'gtk3' 'expat' 'cairo' 'libxcb' 'dbus' 'nspr' 'glib2' 'libxfixes' \
    'libcups' 'glibc' 'libxext' 'nss' 'mesa' 'libdrm' 'gdk-pixbuf2' 'libxkbcommon' 'libxdamage' 'at-spi2-core' 'libx11' 'libxrandr')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('660c3348a021ac43dbf61aa4b8d2f507bdc8c7679a7704526fa20893dc8cc1e6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}" "${pkgdir}/usr"
    cp "${srcdir}/usr/bin/${pkgname%-bin}" "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}"/* "${pkgdir}/opt/${pkgname%-bin}"    
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}