#! /bin/bash

Name="QSyncthingTray"
LowercaseName=$(echo "${Name,,}")
pkgname="${LowercaseName}-git"
provides=("${LowercaseName}")
conflicts=("${LowercaseName}")

pkgdesc="Syncs files among devices, and shows the sync status on a tray icon. Version with the latest unreleased improvements."
url="https://github.com/sieren/${Name}"
license=("LGPL3")

pkgver=421
pkgrel=3
arch=("i686" "x86_64")

makedepends=("cmake" "git")
depends=("qt5-location" "qt5-webengine" "startup-settings-git" "syncthing")
source=("git+${url}.git" "${LowercaseName}.desktop")
md5sums=("SKIP" "SKIP")


pkgver () {
	cd "${Name}"
	git rev-list --count HEAD
}


build() {
	cd "${srcdir}/${Name}"
	mkdir "build"
	cd "build"

	cmake ".."
	make
}


package() {
	install -Dm755 "${srcdir}/${Name}/build/${Name}" "${pkgdir}/usr/bin/${LowercaseName}"
	install -Dm644 "${srcdir}/${Name}/resources/images/Icon1024.png" "${pkgdir}/usr/share/pixmaps/${LowercaseName}.png"
	install -Dm644 "${srcdir}/${LowercaseName}.desktop" "${pkgdir}/usr/share/applications/${LowercaseName}.desktop"
}

