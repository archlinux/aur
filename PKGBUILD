# Maintainer: Torben Schweren <torben@schweren.dev>
# I copied some things over from Shayne Hartford's PKGBUILD for Wootility: https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=wootility-lekker-appimage
pkgname=wootomation-appimage
pkgver=1.1.0
pkgrel=1
pkgdesc="A macro application by Wooting. (AppImage version)"
arch=('x86_64')
url="https://github.com/WootingKb/wooting-macros"
license=('GPL3')
#
release=${pkgver}
appname=wootomation
filename=${appname}_${pkgver}_amd64.AppImage
inappimage_binaryname=${appname}
inappimage_desktopname=${appname}.desktop
inappimage_iconname=${appname}.png
depends=('webkit2gtk' 'libayatana-appindicator')
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=(!strip)
install=${appname}.install
#changelog=
source=(
	"https://github.com/WootingKb/wooting-macros/releases/download/v$pkgver/${filename}"
	"wootomation.install"
)
#noextract=()
md5sums=(
	"30d5b8117842021838057b5323d06eee"
	"defcfc94f57a12c877fcd840f7f8140c"
)
#validpgpkeys=()

prepare() {
	chmod +x ./${filename}
	./${filename} --appimage-extract usr/bin/${inappimage_binaryname}
	./${filename} --appimage-extract ${inappimage_desktopname}
	./${filename} --appimage-extract ${inappimage_iconname}
    ./${filename} --appimage-extract usr/share/icons
}


#build() {}

#check() {}

package() {
	install -Dpm755 "squashfs-root/usr/bin/${inappimage_binaryname}" "${pkgdir}/usr/bin/${inappimage_binaryname}" # Install the binary from the AppImage to the host
	install -Dpm644 "squashfs-root/${inappimage_desktopname}" "${pkgdir}/usr/share/applications/${inappimage_desktopname}" # Installs the .desktop file from the AppImage to the host
    install -Dpm644 "squashfs-root/${inappimage_iconname}" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${inappimage_iconname}" # Installs the icon from the AppImage to the host
}
