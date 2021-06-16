# Maintainer: My Name <andrea.venturini@tiscali.it>

pkgname=validdesk
pkgver=1.1_407
pkgrel=1
pkgdesc="Valid Desk is a free signature tool developed by Intesi Group for all users who need to digitally sign documents from their desktop quickly and easily."
arch=('x86_64')
url="https://www.intesigroup.com/en/validdesk/"
options=(!strip)

source_x86_64=("https://www.intesigroup.com/wp-content/apps/pub/ValidDesk-${pkgver}-${arch}.AppImage")
noextract=("${pkgname}-${pkgver}-${arch}.AppImage")
sha256sums_x86_64=('9405b175a6338684a0eb725b6e318f71dd7daa9c92e17a0c3f90a7fb5cd10d77')

package() {
	install -Dm755 "${srcdir}/ValidDesk-${pkgver}-${arch}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}"

	# Symlink executable
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/applications"
	"${pkgdir}/opt/${pkgname}/${pkgname}" --appimage-extract ValidDesk.desktop

	mkdir -p "${pkgdir}/usr/share/pixmaps"
	"${pkgdir}/opt/${pkgname}/${pkgname}" --appimage-extract ValidDesk.png
	
	install "squashfs-root/ValidDesk.desktop" "${pkgdir}/usr/share/applications/ValidDesk.desktop"
	install "squashfs-root/ValidDesk.png" "${pkgdir}/usr/share/pixmaps/ValidDesk.png"
}
