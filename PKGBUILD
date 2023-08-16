# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailspring-bin
pkgver=1.11.0
pkgrel=2
pkgdesc="A beautiful, fast and fully open source mail client for Mac, Windows and Linux."
arch=('x86_64')
url="https://getmailspring.com/"
_githuburl="https://github.com/Foundry376/Mailspring"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron17' 'gcc-libs' 'glib2' 'krb5' 'glibc' 'hicolor-icon-theme' 'db5.3' 'libsecret')
license=('GPL3')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('680aa496d5712251b045518cfb5424ad581f9e2b65f83dd76f4aa2d28f28c3e4'
            '976e3d3108195cc220d0a75aa8f098a6638e89989bf5a5983abfd45007d7b7aa')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/Mailspring.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}