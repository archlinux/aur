# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bulkurlopener-appimage"
pkgver=1.12.0
pkgrel=1
pkgdesc="An application that provides the user with multiple utilities to help with managing and using large amounts of urls"
arch=("x86_64")
url="https://bulkurlopener.com/"
_githuburl="https://github.com/EuanRiggans/BulkURLOpener"
license=('MIT')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}-linux.AppImage"
    "LICENSE::https://raw.githubusercontent.com/EuanRiggans/BulkURLOpener/master/LICENSE")
sha256sums=('6906481932f46525fe16ebbea8f34ec4346bca869c8f58a9a91b798fa1fd6aea'
            '02fee1b93a53fbf997a300a147ea7efb5fe2deee2f0d0c6d2f66862a7b7079c7')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/bulkurlopener.AppImage|g;s|bulkurlopener|bulkurlopener|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
