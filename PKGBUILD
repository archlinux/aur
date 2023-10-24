# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ulogviewer-bin
_pkgname=ULogViewer
pkgver=3.0.9.1021
pkgrel=1
pkgdesc="Cross-Platform Universal Log Viewer."
arch=('aarch64' 'x86_64')
url="https://carina-studio.github.io/ULogViewer/"
_githuburl="https://github.com/carina-studio/ULogViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('zlib' 'fontconfig' 'glibc' 'gcc-libs' 'dotnet-runtime')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=("LICENSE::https://raw.githubusercontent.com/carina-studio/ULogViewer/${pkgver}/LICENSE")
sha256sums=('4b023d792eb6b929311286a207c6493e18875bd9d320db8f7a996dd5d5716fea')
sha256sums_aarch64=('65454eaa954931a5ae7ea25e8ded4ff665a91c3af55b84f2562ad0248a391ef6')
sha256sums_x86_64=('9613cc8b0c3e34b3e3e7e0c86900325e5ce2f4ec4532fe69a36a74c24cbd0c7e')
build() {
    mkdir -p "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz" -C "${srcdir}/${pkgname%-bin}"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}