# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: afward <archlinux.gargoyley@simplelogin.co>
pkgname="yakyak-bin"
pkgver=1.5.12_beta
pkgrel=5
pkgdesc="Desktop chat client for Google Hangouts"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/yakyak/yakyak"
license=('MIT')
depends=('bash' 'electron13' 'hicolor-icon-theme')
optdepends=('noto-fonts-emoji: Emoji support')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver%_beta}-rolling-beta/${pkgname%-bin}-${pkgver//_/-}-linux-arm64.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver%_beta}-rolling-beta/${pkgname%-bin}-${pkgver//_/-}-linux-i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver%_beta}-rolling-beta/${pkgname%-bin}-${pkgver//_/-}-linux-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('0938e294a6b1cede484ebb7d7a31b6eb73e15c24f5565946aea9aea271ef15ae')
sha256sums_aarch64=('5470949e6899a5c873d990dd90a7383f9bd66482e6e3af6f7c798c319e9a83f6')
sha256sums_i686=('eab6f4c3266504fd60311ca6a8e33bdddd814f9eecba977a7b561f009ad7a1bd')
sha256sums_x86_64=('6e0ce6f1ae294458b5ffab641831e339c6a884b2fc9d2d3dc053b7c05a16e11f')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|Exec=${pkgname%-bin}|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 128x128 256x256 512x512 scalable;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}".* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
