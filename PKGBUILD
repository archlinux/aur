# Maintainer: motte <ettom22 at hotmail dot com>
_pkgname=slic3r
_spkgname=Slic3r
pkgname=${_pkgname}-appimage
pkgver=1.3.0
pkgrel=1
pkgdesc="Open Source toolpath generator for 3D printers"
arch=('x86_64')
url="https://slic3r.org/"
license=('AGPL3')
depends=('fuse')
provides=('slic3r')
conflicts=('slic3r')
source=("https://dl.slic3r.org/linux/${_spkgname}-${pkgver}-${arch}.AppImage"
	${_pkgname}.sh)

md5sums=('4f477be9f4eb063f523aaad251c9a612'
	'9132a68ec454c1c16cc1a236fe97574e')

options=(!strip)
_filename=./${_spkgname}-${pkgver}-${arch}.AppImage

prepare() {
	cd "${srcdir}"
	chmod +x ${_filename}
	${_filename} --appimage-extract
}

package() {
	install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	install -dm755 "${pkgdir}/usr/share/applications/"
	cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/${_spkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
