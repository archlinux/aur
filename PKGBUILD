# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="webdesktop-bin"
_appname=Webdesk
pkgver=1.0.0
pkgrel=1
pkgdesc="Example of packagable and distributable web application with the help of pyinstaller and electron."
arch=('x86_64')
url="https://github.com/vimm0/web-desktop"
license=('MIT')
depends=('libxfixes' 'libxext' 'gcc-libs' 'pango' 'libxkbcommon' 'libdrm' 'nodejs' 'alsa-lib' 'dbus' 'libxcomposite' 'libcups' 'gtk3' 'nspr' \
    'glib2' 'libxcb' 'zlib' 'cairo' 'glibc' 'nss' 'libxrandr' 'at-spi2-core' 'expat' 'libxdamage' 'mesa' 'libx11')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/webdesk-${pkgver}/${_appname}-linux-x64.zip")
noextract=("${pkgname%-bin}-${pkgver}.zip")
sha256sums=('eda6d6d78a707f1363a7907d95e2b55875a6cd408f198434afc904266c8d5560')
  
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt" --gname root --uname root
    mv "${pkgdir}/opt/${_appname}-linux-x64" "${pkgdir}/opt/${pkgname%-bin}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${_appname} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}