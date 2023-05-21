# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blurlyric-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A simple, beautiful, and user-friendly third-party player for NetEase Cloud Music.高颜值,高性能的网易云音乐第三方音乐播放器"
arch=('x86_64')
url="https://blurlyric.app/"
_githuburl="https://github.com/Project-And-Factory/BlurLyric"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-bin}")
depends=('nspr' 'nss' 'libdrm' 'mesa' 'glibc' 'libxkbcommon' 'dbus' 'expat' 'libxfixes' 'libxcb' 'libxext' 'gcc-libs' 'pango' 'sh' \
    'libxcomposite' 'at-spi2-core' 'glib2' 'libcups' 'alsa-lib' 'libxrandr' 'gtk3' 'libx11' 'libxdamage' 'cairo' 'python' 'nodejs')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_ubuntu-deb.zip")
sha256sums=('20f021fa394ee3ee2a1e1b2341cd869a97cb7424f505b00cf6bc89ada6fda784')
package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    install -Dm755 -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    rm -rf "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
    sed 's|Exec=blurlyric|Exec=/opt/blurlyric/blurlyric|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    chmod 0755 "${pkgdir}/opt/${pkgname%-bin}/chrome-sandbox"
}