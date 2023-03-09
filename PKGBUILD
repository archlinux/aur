# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=muffon-appimage
_pkgname=muffon
pkgver=1.4.0
pkgrel=1
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_githuburl="https://github.com/staniel359/muffon"
license=('MIT')
options=(!strip)
conflicts=(muffon-bin)
depends=(hicolor-icon-theme zlib)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage")
sha512sums=('d93bc2447bf72fc5d780d055e5be31920e6e3ede397b53af8e3b2c13b5422abd31e504aaf2f49fc83e4c4600c0431c5bc50d4b20f99cac0ac19a39ad30efe627')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/#Exec=/g;s/Categories=Audio/Categories=AudioVideo/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
	for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
    	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
	done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
