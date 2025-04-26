# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='chatterino2'
pkgname=${_pkgname}-bin
provides=chatterino
conflicts=chatterino
pkgver=2.5.3 #unused var. but needed to update
pkgrel=4
pkgdesc='A chat client for Twitch.tv.'
arch=('x86_64')
url='https://github.com/chatterino/${_pkgname}'
license=('MIT')
depends=(glib2 gdk-pixbuf2 hicolor-icon-theme libnotify openssl
	qt6-{base,5compat,imageformats,svg} qtkeychain-qt6)
optdepends=('streamlink: For piping streams to video players'
			'qt6-wayland: Wayland support')
makedepends=('flatpak')
provides=(chatterino)
conflicts=(chatterino)
prepare() {
	export FLATPAK_USER_DIR=${srcdir}
	flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak --user install -y --reinstall --no-deps flathub com.chatterino.chatterino
}
pkgver() {
	flatpak info com.chatterino.chatterino|grep Version|awk '{print $2}'
}
package() {
	install -d "${pkgdir}"/usr/share
	cd app/com.chatterino.chatterino/current/active/files
	mv bin "${pkgdir}"/usr
	mv share/{applications,icons} "${pkgdir}"/usr/share
}
