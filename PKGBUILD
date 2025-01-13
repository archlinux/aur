# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyedit-bin
_pkgname=EasyEdit
_pkgver=1.3.6
_subver=c
pkgver="${_pkgver}${_subver}"
_electronversion=33
pkgrel=1
pkgdesc="An easy markdown editor that allows you to write MarkDown (MD) and preview it in real-time. You can save, load .md files and export to PDF.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/gcclinux/EasyEdit"
license=('MIT')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/gcclinux/EasyEdit/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64.rpm")
sha256sums=('71385eb5d7dd9bd556196b805ff27e72710a85f9c31c230eb503b6d68de91596'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('78e47f952c46e420c2e2158ab2e95cf08a679cbf42e3bcc1642c1d402821e687')
sha256sums_armv7h=('388edcced2a5ad049442915e87ef47a9f3051848e88b20b5b2c739eb93d43e24')
sha256sums_x86_64=('fbdf7bb312f9963e85f213b406f0c2210498b3764369843b978588783e2b2b17')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/"{app.asar,"${pkgname%-bin}.png"} -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}