# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=cinny-dekstop
_appimagename=Cinny_desktop-x86_64.AppImage
pkgname=cinny-desktop-appimage
pkgver=4.2.0
pkgrel=1
pkgdesc="Yet another matrix client for desktop"
arch=("x86_64")
url="https://github.com/cinnyapp/cinny-desktop"
license=('AGPLv3')
source=("${url}/releases/download/v${pkgver}/${_appimagename}")
sha256sums=("70b4426d7d7f770fd42da102b0073cd2dcb52b0d2e13dddab15246ff5c2ab078")
options=(!strip)
provides=("cinny")
conflicts=("cinny-desktop" "cinny-dekstop-bin")

prepare() {
	cd "$srcdir"

	chmod +x "./${_appimagename}"
	./${_appimagename} --appimage-extract
}

package() {
	install -Dm755 "${srcdir}/${_appimagename}" "${pkgdir}/usr/bin/cinny"

	install -dm755 "${pkgdir}/usr/share/applications"
	cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
	cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/applications" "${pkgdir}/usr/share/"
}
