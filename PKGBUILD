# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=medikojs-client-bin
_pkgname=Mediko
pkgver=0.0.4
_subver=alpha
_electronversion=32
pkgrel=1
pkgdesc="A solution te help users store and analyze health data (body parameters, diet, medications schema).(Prebuild version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/rafalhogent/medikoJs"
license=('LicenseRef-unknown')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}-${_subver}/${pkgname%-bin}-v${pkgver}-${_subver}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/rafalhogent/medikoJs/${_subver}/client/public/icons/favicon-128x128.png"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('2b2ba3d851c38da5eefb67dc15d0adcbc85eaf9bcda7b820b88f49a94116a47b'
            'ce61a0d27e9167938ce2083e1391de1ee514b40d8a0f5c3602a7a04f449f6779'
            'a2160c77557a10eebb69b2e0e3dbe775bc02be1a20cdd35bb06f8bcb298fa3ed'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}