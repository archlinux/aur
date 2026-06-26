# Maintainer: Harsh Narayan Jha <harshnj at proton dot me>

pkgname=ffstudio-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Node-based FFmpeg frontend"
arch=('x86_64')
url="https://github.com/Draver93/ff-studio"
license=('GPL3')
depends=('ffmpeg' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('ffstudio')
conflicts=('ffstudio')
options=(!debug)
source=("${url}/releases/download/v${pkgver}/ffstudio-${pkgver}-x86_64-unknown-linux-gnu.deb")
sha256sums=('cac0b0cf7678cf1bcf0f2f3e55b9bd3bbdea71321370f4761c0b5c054735d1c3')
_pkgname="FFStudio"
_pkgdesktop="${_pkgname}.desktop"
_pkgmetainfo="com.fai.ffstudio.metainfo.xml"

prepare() {
	tar -xf data.tar.gz
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/doc/${_pkgname}"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/metainfo"

    install -m755 \
        "${srcdir}/usr/bin/ffstudio" \
        "${pkgdir}/usr/bin/ffstudio"

    install -m644 \
        "${srcdir}/usr/share/applications/${_pkgdesktop}" \
        "${pkgdir}/usr/share/applications/${_pkgdesktop}"

    install -m644 \
        "${srcdir}/usr/share/doc/${_pkgname}/copyright" \
        "${pkgdir}/usr/share/doc/${_pkgname}/copyright"

    install -m644 \
        "${srcdir}/usr/share/metainfo/${_pkgmetainfo}" \
        "${pkgdir}/usr/share/metainfo/${_pkgmetainfo}"

    cp -a "${srcdir}/usr/lib/${_pkgname}/." \
          "${pkgdir}/usr/lib/${_pkgname}/"

    cp -a "${srcdir}/usr/share/icons/." \
          "${pkgdir}/usr/share/icons/"
}
