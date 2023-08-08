# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=salesforce2sql-bin
pkgver=0.9.0
pkgrel=2
pkgdesc="Electron app to convert a Salesforce org's schema into a similarly shaped database."
arch=('x86_64')
url="https://github.com/acrosman/Salesforce2Sql"
license=('MIT')
depends=('gtk3' 'alsa-lib' 'libxcb' 'nss' 'libdrm' 'libxrandr' 'at-spi2-core' 'bash' 'pango' 'nodejs' 'make' 'libxfixes' 'expat' 'libxcomposite' \
    'libxext' 'cairo' 'dbus' 'python' 'glib2' 'glibc' 'libxkbcommon' 'gcc-libs' 'libx11' 'libcups' 'libxdamage' 'mesa' 'nspr' 'python-setuptools')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('54691aea18d09b8681fba38a568960673cea0011a1c1cfc3a378a72cb3babcd4')
package() {
   install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
   cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt/${pkgname%-bin}"
   cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
   sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
   install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}