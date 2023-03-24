# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=nteract
pkgname="${_pkgname}-appimage"
pkgver=0.28.0
pkgrel=2
pkgdesc="An open-source organization committed to creating fantastic interactive computing experiences that allow people to collaborate with ease."
arch=("x86_64")
url="https://nteract.io/"
_githuburl="https://github.com/nteract/nteract"
license=("BSD 3-Clause")
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
        "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('85ee58064e301b9804fc33a5d88988428737f958de9994eada09d100f7d59dc0'
            'd2c4e0350578376f33f783b98c686c1074fac325c19035d8c727875703d82018')
     
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/nteract.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for i in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
