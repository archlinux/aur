# Maintainer: hu3rror <hu3rror@protonmail.com>
# Contributor: ventusliberum <dafeinayius@gmail.com>

pkgname=wonderpen-appimage
_pkgname=wonderpen
pkgver=2.2.5
_pkgver=6780
pkgrel=1
pkgdesc="A professional writing app with a focused mode and markdown support"
arch=("x86_64")
url="https://www.tominlab.com/en/wonderpen"
license=(custom)
provides=('wonderpen')
conflicts=('wonderpen')
options=(!strip)
source=("https://file.tominlab.com/WonderPen/${pkgver%.*}/WonderPen_linux_x86_64_${pkgver}(${_pkgver}).AppImage"
	'wonderpen.sh')
sha256sums=('f1c11c7e59ac198445fde466527f6d22367d612db79ba12ee35695062dff36f9'
	'e9d4b90a89dad8de88c49346fff51e3813a7f1503ab3d058b87cf647d0946a10')
noextract=('wonderpen.AppImage')
_filename="WonderPen_linux_x86_64_${pkgver}(${_pkgver}).AppImage"

prepare() {
	cd "${srcdir}"
	chmod +x ${_filename}
	./${_filename} --appimage-extract
	sed -i "s,Exec=AppRun,Exec=/usr/bin/${_pkgname} %F,g" "squashfs-root/${_pkgname}.desktop"
}

package() {
	install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
}
