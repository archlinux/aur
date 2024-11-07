# Maintainer: My Name <andrea.venturini@tiscali.it>
pkgname=igdesk
pkgver=1.4_595
pkgrel=1
pkgdesc="IG DESK is a free signature tool developed by Intesi Group for all users who need to digitally sign documents from their desktop quickly and easily."
arch=('x86_64')
url="https://www.intesigroup.com/it/software-firma-digitale/ig-desk/"
options=(!strip)
source_x86_64=("https://github.com/intesi-group/ig-desk/releases/download/v1.4-595/IGDesk-${pkgver}-${arch}.AppImage")
noextract=("${pkgname}-${pkgver}-${arch}.AppImage")
sha256sums_x86_64=('70fe41fef9ddcdf547aa1be21fae56a36cb4419828ddb5f3166af61be00e4c9c')

package() {
	install -Dm755 "${srcdir}/IGDesk-${pkgver}-${arch}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}"

	# Symlink executable
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/applications"
	"${pkgdir}/opt/${pkgname}/${pkgname}" --appimage-extract IGDesk.desktop
	sed -i "s/Exec=IGDesk/Exec=\/bin\/${pkgname}/g" squashfs-root/IGDesk.desktop

	mkdir -p "${pkgdir}/usr/share/pixmaps"
	"${pkgdir}/opt/${pkgname}/${pkgname}" --appimage-extract IGDesk.png
	
	install "squashfs-root/IGDesk.desktop" "${pkgdir}/usr/share/applications/IGDesk.desktop"
	install "squashfs-root/IGDesk.png" "${pkgdir}/usr/share/pixmaps/IGDesk.png"
}
