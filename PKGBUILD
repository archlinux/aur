# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=muffon
pkgname="${_pkgname}-appimage"
pkgver=1.4.0
pkgrel=2
pkgdesc="Music streaming browser,retrieves audio, video and metadata from various Internet sources."
arch=('x86_64')
url="https://muffon.netlify.app/"
_githuburl="https://github.com/staniel359/muffon"
license=(MIT)
options=(!strip)
providers=(staniel359)
conflicts=("${_pkgname}")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('7d82d480cac007b72e744bdd55ff7ed14da7ee1f4f8ed001737e09d17d32b087'
            '4985e8b12eb4ad2141288d641a74f147bd64f3373000e4011092c526b4cf0855')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/muffon.AppImage/g;s/Categories=Audio/Categories=AudioVideo/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
	for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
    	install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
	done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}