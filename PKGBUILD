# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="electron-pdf-viewer-bin"
_appname="Electron-PDF-Viewer"
pkgver=1.0
pkgrel=1
pkgdesc="PDF viewer created using Electron framework and PDF.js"
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/praharshjain/Electron-PDF-Viewer"
license=('MIT')
depends=('pango' 'libx11' 'libxrender' 'nss' 'nspr' 'gdk-pixbuf2' 'libcups' 'libxdamage' 'at-spi2-core' 'alsa-lib' 'libxcb' \
    'libxtst' 'libxi' 'fontconfig' 'libxfixes' 'gcc-libs' 'freetype2' 'glib2' 'libxext' 'glibc' 'cairo' 'expat' 'gtk2' \
    'libxcomposite' 'dbus' 'libxss' 'libxcursor' 'libxrandr')
conflicts=("${pkgname%-bin}")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Electron-PDF-Viewer_${pkgver}.0_armv7l.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/Electron-PDF-Viewer_${pkgver}.0_ia32.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Electron-PDF-Viewer_${pkgver}.0_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/praharshjain/Electron-PDF-Viewer/master/LICENSE")
sha256sums=('70fbb7828155cceb6b104bad95d085832731eec32b74683ff34740e2161e2e42')
sha256sums_armv7h=('47ee8289ac564315538e97c8abf7e4907323f0a54120e3aa5dfdaa5af0adef59')
sha256sums_i686=('924b9497d979f39df36b594a2d553b5e9c7f233144943ec51c51831518f33a5f')
sha256sums_x86_64=('5531e0281ebf710ff5f04fb605eb314226c45ff5ecc8888387ab44423b1d9da5')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/"
    mv "${pkgdir}/usr/lib/${_appname}" "${pkgdir}/opt/"
    sed "s|Exec=${_appname}|Exec=/opt/${_appname}/${_appname}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    chmod 755 "${pkgdir}/opt/${_appname}/${_appname}"
}