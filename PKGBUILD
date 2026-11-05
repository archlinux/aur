# Maintainer: Anany Sachan <ananysachan2005@gmail.com>
pkgname=pokeclicker-automation-bin
_pkgname="PokéClicker with Scripts"
pkgver=1.2.15
pkgrel=2
pkgdesc="Pokeclicker Desktop with automation scripts support"
arch=('x86_64')
url="https://github.com/Farigh/pokeclicker-automation-desktop"
license=('GPL3')
depends=('alsa-lib' 'at-spi2-core' 'ffmpeg' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: app indicator support')
provides=('pokeclicker')
conflicts=('pokeclicker-bin' 'pokeclicker-scripts-bin')
install="${pkgname}.install"
options=('!debug' '!strip')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/pokeclicker-desktop-with-scripts_${pkgver}_amd64.deb")
sha256sums=('1d8d5d020ee57efdb6f455197de84e092fd0a1189127df6731e1a03af6403d3d')

prepare() {
	cd "$srcdir"
	tar -xJf data.tar.xz
}

package() {
	cd "$srcdir"
	install -dm755 "${pkgdir}/opt"
	cp -a "opt/${_pkgname}" "${pkgdir}/opt/pokeclicker-automation"
	cp -a "usr" "${pkgdir}/"
	install -dm755 "${pkgdir}/usr/bin"
	ln -sf "/opt/pokeclicker-automation/pokeclicker-desktop-with-scripts" "${pkgdir}/usr/bin/pokeclicker"
	chmod 4755 "${pkgdir}/opt/pokeclicker-automation/chrome-sandbox"
}