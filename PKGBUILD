# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=advanced-passgen-bin
pkgver=2.4.2
pkgrel=3
pkgdesc="Advanced Password Generator"
arch=('x86_64')
url="https://codedead.com/software/advanced-passgen"
_githuburl="https://github.com/CodeDead/Advanced-PassGen"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'gdk-pixbuf2' 'glib2' 'gcc-libs' 'cairo' 'webkit2gtk' 'glibc' 'gtk3' 'libsoup')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('baaf127575a6205ce121cf7bc3bb3f3cc45333c3e0d388e53b27638f45cca929')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}