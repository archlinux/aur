# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blurlyric-bin
pkgver=2.4
pkgrel=4
pkgdesc="A simple, beautiful, and user-friendly third-party player for NetEase Cloud Music.高颜值,高性能的网易云音乐第三方音乐播放器"
arch=('x86_64')
url="https://blurlyric.app/"
_githuburl="https://github.com/Project-And-Factory/BlurLyric"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nspr' 'nss' 'libdrm' 'mesa' 'glibc' 'libxkbcommon' 'dbus' 'expat' 'libxfixes' 'libxcb' 'libxext' 'gcc-libs' 'pango' \
    'libxcomposite' 'at-spi2-core' 'glib2' 'libcups' 'alsa-lib' 'libxrandr' 'gtk3' 'libx11' 'libxdamage' 'cairo')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_ubuntu-0fc3fe9713556040b35c54874c047cfcd2e6824d.deb.zip")
sha256sums=('dd0cc53636376a20db154efd169204010eaa6189df4d131271e07fb1da36ad69')
prepare() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}.0_amd64.deb"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|%U|--no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}