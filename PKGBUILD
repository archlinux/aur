# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blurlyric
_appname=BlurLyric
pkgver=2.4
pkgrel=1
pkgdesc="A simple, beautiful, and user-friendly third-party player for NetEase Cloud Music.高颜值,高性能的网易云音乐第三方音乐播放器"
arch=('x86_64')
url="https://blurlyric.app/"
_githuburl="https://github.com/Project-And-Factory/BlurLyric"
license=('GPL3')
conflicts=("${pkgname}")
depends=('libxkbcommon' 'libxcomposite' 'libxext' 'libdrm' 'libxfixes' 'cairo' 'expat' 'gtk3' 'hicolor-icon-theme' 'gcc-libs' 'glib2' \
    'nss' 'alsa-lib' 'bash' 'nspr' 'at-spi2-core' 'libcups' 'libxrandr' 'pango' 'libxdamage' 'mesa' 'libx11' 'libxcb' 'python' 'dbus' 'glibc')
makedepends=('npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2f39b55eed9ae10bea7cd5eb607f955f271299750bb826e30336421523d9cfbc')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${_appname}-${pkgver}/out/${pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/src/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "${_appname}" --exec "/opt/${pkgname}/${pkgname} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}