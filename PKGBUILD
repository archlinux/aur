# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fishpi-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="摸鱼派新版客户端"
arch=('x86_64')
url="https://fishpi.cn"
_githuburl="https://github.com/imlinhanchao/fishpi-desktop"
license=('custom')
depends=('libxcomposite' 'gcc-libs' 'glibc' 'libxcb' 'alsa-lib' 'at-spi2-core' 'gdk-pixbuf2' gtk3 pango libx11 libxdamage libxkbcommon libxext libxrandr libxfixes nspr glib2 cairo mesa libcups dbus nss libdrm expat)
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/imlinhanchao/fishpi-desktop/master/build/icons/256x256.png"
    "LICENSE.html::${url}/privacy")
sha256sums=('5c010e73af3991917ec8f0ee7b8025171ef1636e4d8cbc58b4b90b9c9351cdaf'
            'f787ad13f4b9a416cb40a8562ddd0868a42e24c0f70f52c34ee87f7435dcbba0'
            '2dc66d4484d4f15e017ae68954fca5e8a23aadbfc4413b5f7f636bc67a728742')
 
package() {
   install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
   cp -r "${srcdir}/${pkgname%-bin}-${pkgver}-linux/"* "${pkgdir}/opt/${pkgname%-bin}"
   gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "摸鱼派fishpi" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}-app --no-sandbox %U"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
