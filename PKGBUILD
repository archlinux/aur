# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sleek-bin
pkgver=2.0.0_dev16
pkgrel=1
pkgdesc="todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'glibc' 'libxdamage' 'nss' 'cairo' 'libxcb' 'dbus' 'at-spi2-core' 'alsa-lib' 'libx11' \
    'libxcomposite' 'mesa' 'gcc-libs' 'expat' 'libxkbcommon' 'libcups' 'gtk3' 'libdrm' 'nspr' 'libxrandr' 'libxfixes' 'libxext' 'glib2' 'pango')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/ransome1/sleek/v${pkgver//_/-}/LICENSE")
sha256sums=('1e8f362c547a89727e4d5e3f10f3d0e7f4baec889ffb3e7b5519955ce6f77978'
            '3ad193e099728945a4483894e75ce62b0867ce735822f8800afd8d71bf32dad6')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin} %U --no-sandbox|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}