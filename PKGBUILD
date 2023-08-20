# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whisperpix-bin
_pkgname=WhisperPix
pkgver=1.1.0
pkgrel=1
pkgdesc="Add comments to your photos with your voice"
arch=('x86_64')
url="https://github.com/graham-walker/WhisperPix"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('perl' 'libxext' 'nspr' 'hicolor-icon-theme' 'libdrm' 'pango' 'libcups' 'dbus' 'alsa-lib' 'libx11' 'libxdamage' \
    'cairo' 'libxkbcommon' 'at-spi2-core' 'libxcomposite' 'mesa' 'libxfixes' 'glib2' 'nss' 'gcc-libs' 'libxcb' 'expat' \
    'glibc' 'libxrandr' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/graham-walker/WhisperPix/main/LICENSE")
sha256sums=('f5c0b5b52505f4ad5fa6b72556ca19adbe559a70cf2534d1000ad204706c09e6'
            '5fc34925726421c2268a2a719ceebe463aef8ad39480b1d08daee3044fd6381e')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -perm -777 -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${_pkgname}/${pkgname%-bin}" \
        "${pkgdir}/opt/${_pkgname}/chrome-sandbox" \
        "${pkgdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/exiftool-vendored.pl/bin/exiftool" \
        "${pkgdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/sharp/build/Release/sharp-linux-x64.node" \
        "${pkgdir}/opt/${_pkgname}/resources/app.asar.unpacked/public/bin/linux/ffmpeg-n6.0-latest-linux64-lgpl-6.0/bin/ffmpeg" \
        "${pkgdir}/opt/${_pkgname}/resources/app.asar.unpacked/public/bin/linux/whisper.cpp-1.4.0/main" \
        "${pkgdir}/opt/${_pkgname}/resources/app.asar.unpacked/public/bin/shared/whisper.cpp/models/ggml-tiny.bin"
}