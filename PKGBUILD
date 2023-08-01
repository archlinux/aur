# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=musicfree-desktop
_appname=MusicFreeDesktop
pkgver=0.0.0_alpha.0
pkgrel=1
pkgdesc="插件化、定制化、无广告的免费音乐播放器"
arch=('any')
url="http://musicfree.upup.fun/"
_githuburl="https://github.com/maotoumao/MusicFreeDesktop"
license=('GPL3')
conflicts=("${pkgname}")
depends=('libxcb' 'libxrandr' 'glib2' 'libxfixes' 'glibc' 'nss' 'pango' 'libdrm' 'at-spi2-core' 'alsa-lib' 'gcc-libs' 'dbus' 'libxkbcommon' \
    'gtk3' 'libxcomposite' 'nspr' 'libxext' 'cairo' 'libcups' 'libxdamage' 'mesa' 'expat' 'libx11')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('096208d7571985bf84b18f762725870aa53b049514aeb9e1939c3bafd523ffb2')
build() {
    cd "${srcdir}/${_appname}-${pkgver//_/-}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${_appname}-${pkgver//_/-}/out/${_appname%Desktop}-linux-x64/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver//_/-}/res/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "${_appname}" --exec "/opt/${pkgname}/${_appname%Desktop} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}