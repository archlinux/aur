# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=enotebook-bin
_pkgname=eNotebook
pkgver=1.0.0
pkgrel=1
pkgdesc="Opensource desktop app to create and store notes."
arch=('x86_64')
url="https://enotebook-react.vercel.app/"
_ghurl="https://github.com/aestrus219/eNotebook"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron27')
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}@${pkgver}-linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('6eeb0514b9690bdef6c4d5cc8ea991f76fe12fdff6d616c2945df704b7a26efa'
            'e62ad5836f1ffe73ffc94f6432421253f6e8e2894e0db07debcb84c7178d5db6')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}