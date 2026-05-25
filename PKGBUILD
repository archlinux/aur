# shellcheck shell=bash
# Maintainer: Ahmet Cetinkaya <contact@ahmetcetinkaya.me>
# Maintainer: Prasanna Venkadesh <prasmailme at gmail dot com>
# shellcheck disable=SC2034,SC2154

pkgname=whph-bin
pkgver=0.22.3
pkgrel=1
epoch=
pkgdesc="A comprehensive productivity app designed to help you manage tasks, develop new habits, and optimize your time."
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
sha256sums=('a0d2fb7d852410a6590ef9627bce60ddb5a471ab0eb8175fd2f9e5fd9b2afefa')
validpgpkeys=()

package() {
	# install application file
	install -dm755 "${pkgdir}/opt/${pkgname}/"
	cp "${srcdir}/${pkgname%-bin}" -vt "${pkgdir}/opt/${pkgname}/"

	# copy application files.
	cp -avt "${pkgdir}/opt/${pkgname}/" data share lib

	# Desktop entry file
	install -Dm644 "share/applications/me.ahmetcetinkaya.whph.desktop" -vt "${pkgdir}/usr/share/applications"

	# symlink executable
	install -dm755 "${pkgdir}/usr/bin/"
	ln -s "/opt/$pkgname/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
