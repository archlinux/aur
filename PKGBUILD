# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=cinny-dekstop
_appimagename=Cinny_desktop-x86_64.AppImage
pkgname=cinny-desktop-appimage
pkgver=2.2.6
pkgrel=1
pkgdesc="Yet another matrix client for desktop"
arch=("x86_64")
url="https://github.com/cinnyapp/cinny-desktop"
license=('AGPLv3')
source=("${url}/releases/download/v${pkgver}/${_appimagename}")
sha256sums=("f34e4dace180085d41d523947fef84a17b2f3b3642357676d74d67afb9572ecd")
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
