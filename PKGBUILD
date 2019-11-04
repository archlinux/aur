#! /bin/bash
url="https://github.com/sieren/QSyncthingTray"


pkgver() {
	commitsCount "${url}"
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
	cp "${srcdir}/${Name}/resources/images/Icon1024.png" "${pkgdir}/usr/share/pixmaps/${LowercaseName}.png"
	cp "${srcdir}/${LowercaseName}.desktop" "${pkgdir}/usr/share/applications/${LowercaseName}.desktop"

	find "${pkgdir}" -type d -exec chmod u=rwx,g=rx,o=rx {} \;
	find "${pkgdir}" -type f -exec chmod u=rw,g=r,o=r {} \;
	chmod +x "${pkgdir}/usr/bin/${LowercaseName}"
}


Name="QSyncthingTray"
LowercaseName=$(echo "${Name,,}")
provides=("${LowercaseName}")
conflicts=("${LowercaseName}")
pkgname="${LowercaseName}-git"

pkgdesc="Syncs files among devices, and shows the sync status on a tray icon. Version with the latest unreleased improvements."
license=("LGPL3")

pkgver=$(pkgver)
pkgrel=3
arch=("i686" "x86_64")

makedepends=("cmake" "commits-count-git" "git")
depends=("qt5-location" "qt5-webengine" "startup-settings-git" "syncthing")
source=("git+${url}.git" "${LowercaseName}.desktop")
md5sums=("SKIP" "SKIP")

