# Maintainer: Hunter Wittenborn <git@hunterwittenborn.me>
# Past Maintainer: Alfin Bakhtiar Ilhami <alfin at nuclea dot id>
# Past Maintainer: Jan-Tarek Butt <tarek at ring0 dot de>

pkgname=bootstrap-studio
pkgver=5.5.4
pkgrel=1
pkgdesc="Bootstrap Studio is a powerful tool which web developers and designers use to create layouts and fully functional websites using the Bootstrap framework."
arch=("x86_64")
license=("custom")
url="https://bootstrapstudio.io/"

source=("https://bootstrapstudio.io/releases/desktop/${pkgver}/Bootstrap Studio.AppImage")
sha256sums=("SKIP")

prepare() {
	chmod +x "Bootstrap Studio.AppImage"
	./"Bootstrap Studio.AppImage" --appimage-extract
}

package() {
	mkdir -p "${pkgdir}/opt/bootstrap-studio"
	cp -r "${srcdir}/squashfs-root" "${pkgdir}/opt/bootstrap-studio"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/opt/bootstrap-studio/squashfs-root/AppRun" "${pkgdir}/usr/bin/bootstrap-studio"

	mkdir -p "${pkgdir}/usr/share/applications"
	cp -r "${srcdir}/squashfs-root/bstudio.desktop" "${pkgdir}/usr/share/applications/"

	mkdir -p "${pkgdir}/usr/share/icons/hicolor/0x0/apps/"
	cp -r "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/bstudio.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/"
}
