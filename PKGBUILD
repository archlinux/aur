# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xbyyunpan-bin
pkgver=3.11.18
pkgrel=1
pkgdesc="小白羊网盘 - Powered by 阿里云盘Open"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/gaozhangmin/aliyunpan"
license=('MIT')
provides=("aliyunpan-liupan1890")
conflicts=("${pkgname%-bin}" "aliyunpan-liupan1890" "aliyunpan-odomu")
depends=('alsa-lib' 'glibc' 'libxdamage' 'pango' 'libxrandr' 'libxext' 'libxcb' 'libx11' 'libxcomposite' 'libxkbcommon' 'gcc-libs' 'nss' \
    'libxfixes' 'at-spi2-core' 'libdrm' 'cairo' 'gtk3' 'glib2' 'nspr' 'wayland' 'libcups' 'expat' 'mesa' 'hicolor-icon-theme' 'dbus')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/XBYDriver-${pkgver}-linux-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/gaozhangmin/aliyunpan/main/LICENSE")
sha256sums=('37b92e7918a9a8599a558d5e978900966b243cc9f6c964c36f4afa35bf50e009')
sha256sums_aarch64=('19c4ab7fde9ece817c7504984f5b57e5b0bb8a6b857afad0039a0f353dbb727f')
sha256sums_armv7h=('ece5d2df2fc740c656a2c96622427dab27ab9d185f59c4ecab2291383c5b167e')
sha256sums_x86_64=('13aab286f97b4e646d2d7c3f1d200101365eb5f5db45c172135cfc8c8c4706f6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/opt/小白羊云盘" "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/小白羊云盘|/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/256x256"
}