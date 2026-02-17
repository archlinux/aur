# Maintainer: Prasanna Venkadesh <prasmailme at gmail dot com>

pkgname=whph-bin
pkgver=0.20.4
pkgrel=1
epoch=
pkgdesc="Productivity app for task management, habit tracking and time optimization"
arch=('x86_64')
url="https://github.com/ahmet-cetinkaya/whph"
license=('GPL-3.0-only')
groups=()
depends=('gstreamer' 'gtk3' 'libice' 'gst-plugins-base-libs' 'libsm' 'libayatana-appindicator' 'libnotify' 'zenity' 'xorg-xprop' 'wmctrl' 'xdotool' 'jq')
makedepends=()
checkdepends=()
optdepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=()
backup=()
options=()
install="${pkgname%-bin}.install"
changelog=
source=("$url/releases/download/v$pkgver/${pkgname%-bin}-v$pkgver-linux.tar.gz")
noextract=()
sha256sums=('c70202acad38e3d61c4eecff257905fd1a69610f1b7f9eeaf887d93add9dca16')
validpgpkeys=()

package() {
	# install application file
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cp "${srcdir}/${pkgname%-bin}" -vt "${pkgdir}/opt/${pkgname}/"

	# copy application files.
	cp -avt "${pkgdir}/opt/${pkgname}/" data share lib

	# Desktop entry file
	install -Dm644 "share/applications/${pkgname%-bin}.desktop" -vt "${pkgdir}/usr/share/applications"
	
	# symlink executable
	install -dm755 "${pkgdir}/usr/bin/"
	ln -s "/opt/$pkgname/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
