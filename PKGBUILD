# Maintainer: KUMAX <kumax2048@pm.me>
pkgname=biliup-app-appimage
pkgver=0.4.0
pkgrel=1
pkgdesc="Bilibili uploader, supports Windows, Linux, macOS."
license=("unknown")
arch=("x86_64")
url="https://github.com/ForgQi/biliup-app"
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
source=("biliup-app_${pkgver}_amd64.AppImage::https://github.com/ForgQi/biliup-app/releases/download/app-v${pkgver}/biliup-app_${pkgver}_amd64.AppImage")
sha256sums=('11cb4f7705c0ec41bdb8c87a18d94b9bb7928ab86f04f081d649147bf2e8479f')
options=(!strip)

_pkgname=biliup-app
_sourcename=biliup-app_${pkgver}_amd64.AppImage
_installdir=/opt/appimages

prepare() {
	cd ${srcdir}
    chmod a+x ${_sourcename}
	${srcdir}/${_sourcename} --appimage-extract > /dev/null
}

package() {
	install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${pkgdir}//usr/share/"
	install -Dm755 ${_sourcename} "${pkgdir}/${_installdir}/biliup-app.AppImage"
	install -Dm644 "${srcdir}/squashfs-root/biliup-app.desktop" "${pkgdir}/usr/share/applications/biliup-app.desktop"
}
