# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=salesforce2sql-bin
pkgver=0.9.0
pkgrel=3
pkgdesc="Electron app to convert a Salesforce org's schema into a similarly shaped database."
arch=('x86_64')
url="https://github.com/acrosman/Salesforce2Sql"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('gtk3' 'alsa-lib' 'libxcb' 'nss' 'libdrm' 'libxrandr' 'at-spi2-core' 'bash' 'pango' 'make' 'libxfixes' 'expat' 'libxcomposite' \
    'libxext' 'cairo' 'dbus' 'python' 'glib2' 'glibc' 'libxkbcommon' 'gcc-libs' 'libx11' 'libcups' 'libxdamage' 'mesa' 'nspr' 'python-setuptools')
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('54691aea18d09b8681fba38a568960673cea0011a1c1cfc3a378a72cb3babcd4')
prepare() {
    sed "s|%U|--no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
   install -Dm755 -d "${pkgdir}/"{opt/,usr/bin}
   cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt/${pkgname%-bin}"
   ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}