# Maintainer: dalto <dalto[at]fastmail.com>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Original Maintainer: raininja <dandenkijin@gmail.com>
pkgname=slimjet
pkgver=38.0.4.0
pkgrel=1
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases"
_libffmpegver=0.73.0
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="http://www.slimjet.com"
_downurl="http://www.slimjetbrowser.com"
license=('custom:freeware')
depends=('nss' 'ttf-font' 'alsa-lib' 'at-spi2-core' 'hicolor-icon-theme' 'libxkbcommon' 'pango' 'mesa' 'libcups' 'libxcomposite' 'libxrandr')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
conflicts=('slimjet-git')
options=('!emptydirs' '!strip')
source=(
    "${pkgname}-${pkgver}_amd64.deb::${_downurl}/release/${pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
    "LICENSE"    
    )
md5sums=('9e3ba53ee4c5779e22f102f58ee89e47'
         '03fbed3bfdf5120ed9060cc099367edf'
         'e2f3d75bbf4ea8cef106adb30c6b4c83')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    bsdtar -xf libffmpeg-${_libffmpegver}.zip -C "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install  -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/slimjet/product_logo_${i/x*}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/flashpeak-slimjet.png
    done
}
