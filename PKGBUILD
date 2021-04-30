# Maintainer: Hunter Wittenborn <git@hunterwittenborn.me>
# Past Maintainer: Alfin Bakhtiar Ilhami <alfin at nuclea dot id>
# Past Maintainer: Jan-Tarek Butt <tarek at ring0 dot de>

pkgname=bootstrap-studio
pkgver=5.6.2
pkgrel=1
pkgdesc="Bootstrap Studio is a powerful tool which web developers and designers use to create layouts and fully functional websites using the Bootstrap framework."
arch=("x86_64")
license=("custom")
url="https://bootstrapstudio.io/"

source=("https://bootstrapstudio.io/releases/desktop/${pkgver}/Bootstrap Studio.AppImage"
				"bstudio.desktop")
sha256sums=("SKIP"
						"SKIP")

prepare() {
	chmod +x "Bootstrap Studio.AppImage"
	./"Bootstrap Studio.AppImage" --appimage-extract
}

package() {
	mkdir -p "${pkgdir}/opt/bootstrap-studio"
	cp -Lr "${srcdir}/squashfs-root" "${pkgdir}/opt/bootstrap-studio"

	mkdir -p "${pkgdir}/usr/bin"
	echo '#!/usr/bin/env bash
    	 gtk-launch bstudio.desktop' | tee "${pkgdir}/usr/bin/bootstrap-studio"
        chmod +x "${pkgdir}/usr/bin/bootstrap-studio"

	mkdir -p "${pkgdir}/usr/share/applications"
	cp -Lr "${srcdir}/bstudio.desktop" "${pkgdir}/usr/share/applications/"

	mkdir -p "${pkgdir}/usr/share/icons/hicolor/0x0/apps/"
	cp -Lr "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/bstudio.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/"
}
