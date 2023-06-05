# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="benchworx-bin"
pkgver=0.0.1
_subver=beta.3
pkgrel=1
pkgdesc="A DynamoDB GUI for local and remote DynamoDB tables"
arch=("x86_64")
url="https://github.com/simonireilly/dynamoDB-benchworx"
license=('custom')
depends=('libxcomposite' 'gcc-libs' 'libx11' 'expat' 'nss' 'alsa-lib' 'dbus' 'gdk-pixbuf2' 'libxcb' 'libxkbcommon' 'libxext' 'libxshmfence' \
    'libdrm' 'cairo' 'libxdamage' 'libcups' 'mesa' 'libxrandr' 'glib2' 'libxfixes' 'at-spi2-core' 'nspr' 'glibc' 'pango' 'gtk3')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}-${_subver}/${pkgname%-bin}_${pkgver}.${_subver}_amd64.deb")
sha256sums=('197f8c47e3b937ae6c24be5b7c49a2cd1f38f29205c6e28af987cc3581e8e41e')
      
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}