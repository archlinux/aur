#! /bin/bash
#  (GPL3+) Alberto Salvia Novella (es20490446e.wordpress.com)

Name="QSyncthingTray"
LowercaseName=$(echo "${Name,,}")
pkgname="${LowercaseName}-git"
pkgver=r421.11936bc
pkgrel=1
pkgdesc="Syncs files among devices, and shows the sync status on a tray icon. Version with the latest unreleased improvements."
arch=("x86_64")
url="https://github.com/sieren/QSyncthingTray"
license=("LGPL3")
makedepends=("cmake" "git")
depends=("qt5-location" "qt5-webengine" "syncthing")
provides=("${LowercaseName}")
conflicts=("${LowercaseName}")
source=("git+${url}.git" "${LowercaseName}.desktop")
md5sums=("SKIP" "SKIP")


pkgver() {
	cd "${srcdir}/${Name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	echo
}


build() {
	cd "${srcdir}/${Name}"

	mkdir "build"
	cd "build"

	cmake ".."
	make
}


package() {
	mkdir --parents "${pkgdir}/usr/bin"
	mkdir --parents "${pkgdir}/usr/share/pixmaps"
	mkdir --parents "${pkgdir}/usr/share/applications"

	mv "${srcdir}/${Name}/build/${Name}" "${pkgdir}/usr/bin/${LowercaseName}"
	mv "${srcdir}/${Name}/resources/images/Icon1024.png" "${pkgdir}/usr/share/pixmaps/${LowercaseName}.png"
	mv "${srcdir}/${LowercaseName}.desktop" "${pkgdir}/usr/share/applications/${LowercaseName}.desktop"

	chmod +x "${pkgdir}/usr/bin/${LowercaseName}"
}

