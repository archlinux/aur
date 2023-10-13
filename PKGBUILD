# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=interactive-data-editor-bin
_pkgname="Interactive Data Editor"
pkgver=2.13.1
pkgrel=2
pkgdesc="A Software to interactively edit data in a graphical manner"
arch=('x86_64')
url="https://koushikphy.github.io/Interactive_Data_Editor/"
_githuburl="https://github.com/Koushikphy/Interactive_Data_Editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'gcc-libs' 'expat' 'libxcb' 'nspr' 'libxext' 'gdk-pixbuf2' 'libxfixes' 'pango' 'dbus' 'libxrandr' 'nss' 'at-spi2-core' \
    'libxcomposite' 'glib2' 'libxkbcommon' 'mesa' 'cairo' 'libxdamage' 'libdrm' 'hicolor-icon-theme' 'libx11' 'alsa-lib' 'libcups' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Koushikphy/Interactive_Data_Editor/v${pkgver}/LICENSE")
sha256sums=('001d2bfd866e318a40056eaa4b95ae52ebc937c784f4c0979f3b275d12aa029e'
            'd728fec9e20c7c6b1528b62e2525c7f98d2f99061e5b8e3bbd33d27f27271265')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}