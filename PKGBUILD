# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ulogviewer-bin"
_appname="ULogViewer"
pkgver=3.0.3.620
pkgrel=1
pkgdesc="Cross-Platform Universal Log Viewer."
arch=('aarch64' 'x86_64')
url="https://carina-studio.github.io/ULogViewer/"
_githuburl="https://github.com/carina-studio/ULogViewer"
license=('MIT')
depends=('zlib' 'fontconfig' 'glibc' 'gcc-libs' 'dotnet-runtime')
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-x64.zip")
source=("LICENSE::https://raw.githubusercontent.com/carina-studio/ULogViewer/master/LICENSE")
sha256sums=('4b023d792eb6b929311286a207c6493e18875bd9d320db8f7a996dd5d5716fea')
sha256sums_aarch64=('4b785f845ee11044e710fbafca17bdc254ef6a8b1251ece033b2583e3d2a34c2')
sha256sums_x86_64=('8471d07096a7fc2644b06a564bea6a41d85605403fbb5f47870b5f4701f7cc96')
   
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}/opt/${pkgname%-bin}" --gname root --uname root
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${_appname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}