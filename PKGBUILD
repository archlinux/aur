# Maintainer: blackwell <main at blackwell dot io>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=atom-ng-bin
_pkgname=Atom-ng
pkgver=1.66.12
pkgrel=7
pkgdesc="The hyper-hackable text editor. Community maintained fork with compiler optimizations."
arch=('x86_64')
url="https://thorium.rocks/atom-ng/"
_ghurl="https://github.com/Alex313031/atom-ng"
license=('MIT')
provides=("${pkgname%-ng-bin}=${pkgver}" "${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-ng-bin}")
depends=(
    'libxcomposite'
    'gdk-pixbuf2'
    'at-spi2-core'
    'libxdamage'
    'bash'
    'gtk3'
    'perl'
    'python'
    'libxkbfile'
    'dbus'
    'libdrm'
    'expat'
    'mesa'
    'curl'
    'zlib'
    'libxrandr'
    'pango'
    'cairo'
    'python-setuptools'
    'libxext'
    'nspr'
    'alsa-lib'
    'libxkbcommon'
    'libxshmfence'
    'libcups'
    'libxfixes'
    'libxcb'
    'nss'
    'openssl-1.1'
    'libsecret'
    'libx11'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux_${pkgver}_AVX.zip"
)
sha256sums=('01ec80c0809bef8bb3cf26072b10ca0c254c7cb08da82063cf76b2e0ce7e78d8')
build() {
    gendesk -f -n -q --categories "TextEditor;Development;IDE;Utility" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U"
    chmod 0755 "${srcdir}/${_pkgname}_${pkgver}_AVX/chrome-sandbox"
    find "${srcdir}/${_pkgname}_${pkgver}_AVX/WidevineCdm" -type f -exec chmod 644 {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}_${pkgver}_AVX/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_AVX/resources/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_AVX/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
