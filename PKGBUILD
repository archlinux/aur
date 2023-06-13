# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=3fa-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A secure and scalable multi-factor authentication system including a client application, admin dashboard, and backend server"
arch=('x86_64')
url="https://3fa.netlify.app/"
_githuburl="https://github.com/Computing-Collective/3FA"
license=('AGPL3')
conflicts=("${pkgname%-bin}")
depends=('libx11' 'libxcomposite' 'libxrandr' 'alsa-lib' 'glibc' 'libxcb' 'libxdamage' 'expat' 'libdrm' 'at-spi2-core' 'dbus' \
    'glib2' 'gtk3' 'nss' 'pango' 'cairo' 'libxkbcommon' 'libxext' 'nspr' 'gcc-libs' 'libcups' 'mesa' 'libxfixes')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('40f4e82e01ef079c8458d73fe3af28f5df76422cf4b33ffcb2a1ab3eeb68ab7d')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/lib/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}