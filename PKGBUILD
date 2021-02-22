# Maintainer Zhang Hua <zhanghuadedn@gmail.com>
pkgname="kde-dolphin-service-menu-ipfs"
pkgver=a527a30
pkgrel=1
pkgdesc="Upload files on IPFS through the globalupload.io"
arch=(x86_64 aarch64)
url=https://github.com/amar-laksh/KDE-DolphinServiceMenu-IPFS
licence=(GPL)
depends=(curl sed coreutils xdg-utils xclip dolphin)
makedepends=(git)
source=(${pkgname}::git+https://github.com/amar-laksh/KDE-DolphinServiceMenu-IPFS)
sha256sums=("SKIP")
pkgver(){
	cd ${srcdir}/${pkgname}
	git log --format=%h -1
}
package(){
	cd ${srcdir}/${pkgname}
	SERVICE_PATH="/usr/share/kservices5/ServiceMenus/"
	ICON_PATH="/usr/share/icons/hicolor/scalable/apps/"
	mkdir -p ${pkgdir}/${SERVICE_PATH}
	mkdir -p ${pkgdir}/${ICON_PATH}
	mkdir -p ${pkgdir}/usr/bin
	install -m644 ${srcdir}/${pkgname}/kipi-ipfs.svgz ${pkgdir}/${ICON_PATH}
	install -m644 ${srcdir}/${pkgname}/dsm-ipfs ${pkgdir}/usr/bin
	install -m644 ${srcdir}/${pkgname}/ipfs.desktop ${pkgdir}/${SERVICE_PATH}
	sed -i "13iName[zh_CN]=上传" ${pkgdir}/${SERVICE_PATH}/ipfs.desktop
	# Add Chinese Entry Name
}
