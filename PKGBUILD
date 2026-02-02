# Maintainer: Anany Sachan <ananysachan2005@gmail.com>
pkgname=pokeclicker-automation-bin
_pkgname="PokéClicker with Scripts"
pkgver=1.2.13
pkgrel=1
pkgdesc="Pokeclicker Desktop with automation scripts support"
arch=('x86_64')
url="https://github.com/Farigh/pokeclicker-automation-desktop"
license=('GPL3')
depends=('alsa-lib' 'at-spi2-core' 'ffmpeg' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: app indicator support')
provides=('pokeclicker')
conflicts=('pokeclicker-bin' 'pokeclicker-scripts-bin')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/pokeclicker-desktop-with-scripts_${pkgver}_amd64.deb")
sha256sums=('578cf4443c9a2472025017056a77d9a8654735525c29a900071f5149e9fa859c')

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