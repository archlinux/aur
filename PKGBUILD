# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fishpi-bin
pkgver=1.3.5
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
sha256sums=('87dad81ad2f57bb136254df8c52e06613e24d296ce3aa39b722b6271dd6c44f5'
            'c8d477f31fadf5c61c54afbc28ddf06af73dfa062b53ce70c47e1092eb05bc94'
            '99b4d784f44816c64bb6a3706c14ae51b0b2f6b4dd724f865049b3733617840c')
 
package() {
   install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
   cp -r "${srcdir}/${pkgname%-bin}-${pkgver}-linux/"* "${pkgdir}/opt/${pkgname%-bin}"
   gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "摸鱼派fishpi" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}-app --no-sandbox %U"
   install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}