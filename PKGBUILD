# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rekordfix-bin
_pkgname=Rekordfix
pkgver=0.15.0
pkgrel=4
pkgdesc="GUI tool for missing functionality to manage a Rekordbox collection"
arch=('x86_64')
url="https://github.com/rzuppur/rekordfix"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
   'bash'
   'electron25'
)
source=(
   "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
   "LICENSE::https://raw.githubusercontent.com/rzuppur/rekordfix/v${pkgver}/LICENSE"
   "${pkgname%-bin}.sh"
)
sha256sums=('4a6ef8fe7dcfb208bbee5c2f5bcbf3711967fd01872dc0ace70d3b68650f876b'
            'ac76bfd52440815cb3e8ec5ea00f1f9b82c9b404219814f2f05c3fe44a9446c5'
            '5354880d20f43a2144f4d291b13f8e3c43dffdefaaaa131ec2e66b573cfaf096')
build() {
   bsdtar -xf "${srcdir}/data.tar.xz"
   sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
   install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}