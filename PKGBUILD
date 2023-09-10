# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=atom-ng-bin
_pkgname=Atom-ng
pkgver=1.66.10
pkgrel=4
pkgdesc="The hyper-hackable text editor. Community maintained fork with compiler optimizations."
arch=('x86_64')
url="https://thorium.rocks/atom-ng/"
_githuburl="https://github.com/Alex313031/atom-ng"
license=('MIT')
provides=("${pkgname%-ng-bin}=${pkgver}" "${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-ng-bin}")
depends=('nspr' 'perl' 'libxdamage' 'at-spi2-core' 'glib2' 'libxcomposite' 'sh' 'gtk3' 'glibc' 'curl' 'libxfixes' 'dbus' 'nss' 'python' 'alsa-lib' 'libxext' \
    'libxrandr' 'gcc-libs' 'libdrm' 'openssl-1.1' 'libsecret' 'pango' 'libxkbfile' 'expat' 'python-setuptools' 'gdk-pixbuf2' 'libxcb' 'zlib' 'libx11' \
    'cairo' 'libxkbcommon' 'mesa' 'libxshmfence' 'libcups')
makedepends=('gendesk')
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.zip")
sha256sums=('9132a5f37c2840f6b94a9bc434dbedb78075005ff0881893ef40556ad404a311')
prepare() {
    gendesk -f -n --categories "TextEditor;Development;IDE;Utility" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
    chmod 0755 "${srcdir}/${_pkgname}_${pkgver}_amd64/chrome-sandbox"
    find "${srcdir}/${_pkgname}_${pkgver}_amd64/WidevineCdm" -type f -exec chmod 644 {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}_${pkgver}_amd64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}