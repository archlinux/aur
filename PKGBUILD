# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apple-music-bin
_pkgname="Apple Music"
pkgver=0.1.4
pkgrel=1
pkgdesc="An Electron app that provides a native Apple Music experience for Linux & Windows."
arch=('x86_64')
url="https://github.com/Alex313031/apple-music-desktop"
license=('BSD')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('libxrandr' 'libxfixes' 'libxkbcommon' 'nspr' 'libx11' 'nss' 'libcups' 'libxext' 'alsa-lib' 'mesa' 'cairo' 'expat' 'pango' \
    'libxcomposite' 'gcc-libs' 'hicolor-icon-theme' 'libxdamage' 'gtk3' 'glibc' 'at-spi2-core' 'libdrm' 'glib2' 'dbus' 'libxcb')
options=('!strip')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('8e4c6ad52099566788bbd01cc792d1ca91e715353e4181f846438dd38a9c98a4')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin} --no-sandbox|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 144x144 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}