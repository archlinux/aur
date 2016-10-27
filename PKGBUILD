# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>

_pkgname=messengerfordesktop
pkgname=${_pkgname}-bin
pkgver=2.0.1
pkgrel=3
pkgdesc="Beautiful desktop client for Facebook Messenger. Binary version."
arch=('i686' 'x86_64')
url="http://messengerfordesktop.com/"
license=('MIT')
conflicts=('messengerfordesktop' 'messengerfordesktop-git')
options=(!strip)
depends=('libxtst' 'alsa-lib' 'gtk2' 'gconf' 'libnotify' 'nss')
makedepends=('tar')

_basename="${_pkgname}-${pkgver}"
noextract=("${_basename}-${CARCH}.deb")

source_i686=("${_basename}-i686.deb::https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/v${pkgver}/${_basename}-linux-i386.deb")
source_x86_64=("${_basename}-x86_64.deb::https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/v${pkgver}/${_basename}-linux-amd64.deb")

sha256sums_i686=('ed05f1afb3d25589c071276c7cc12bff1f5a6e4acb301eeab1cc3300a97d5726')
sha256sums_x86_64=('d4c9eebc60f51c2ba5c136617f6dd71121feb3d8c99b7b563498109d7be74d45')


package() {
	ar p ${noextract[0]} data.tar.gz | tar -zxpC "${pkgdir}"

	cd "${pkgdir}"
	# Fix the window class in desktop file
	sed -i "s/\(StartupWMClass\).\+/\1=messenger for desktop/" "usr/share/applications/${_pkgname}.desktop"

	install -Dm 644 "opt/${_pkgname}/LICENSE" "usr/share/licenses/${pkgname}/LICENSE"
}
