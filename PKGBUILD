# Maintainer: dalto <dalto[at]fastmail.com>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Original Maintainer: raininja <dandenkijin@gmail.com>
pkgname=slimjet
pkgver=38.0.3.0
pkgrel=2
pkgver_libffmpeg=0.73.0
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="http://www.slimjet.com"
license=('custom:freeware')
depends=('nss' 'ttf-font' 'alsa-lib' 'at-spi2-core' 'hicolor-icon-theme' 'libxkbcommon' 'pango' 'mesa' 'libcups' 'libxcomposite' 'libxrandr')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
conflicts=('slimjet-git')
options=('!emptydirs' '!strip')
source=(
    "${pkgname}-${pkgver}_amd64.deb::http://www.slimjetbrowser.com/release/${pkgname}_amd64.deb"
    "libffmpeg.zip::https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/${pkgver_libffmpeg}/${pkgver_libffmpeg}-linux-x64.zip"
    "LICENSE"    
    )
md5sums=('3ea6928579dadc4892c4cc3b484376e3'
         '03fbed3bfdf5120ed9060cc099367edf'
         'e2f3d75bbf4ea8cef106adb30c6b4c83')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    bsdtar -xf libffmpeg.zip -C "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install  -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/slimjet/product_logo_${i/x*}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/flashpeak-slimjet.png
    done
}
