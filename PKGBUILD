# Maintainer: Elk Cloner <dev [at] elkcl [dot] ru>

pkgname=yukigram-bin
pkgver=6.8.2.3
pkgrel=1
pkgdesc="Telegram Desktop, minus the bullshit, plus the features"
arch=(x86_64)
url="https://github.com/yukigram/yukigram"
license=('GPL-3.0-or-later WITH sqlitestudio-OpenSSL-exception')
depends=(glibc fontconfig glib2 hicolor-icon-theme libx11 freetype2)
optdepends=(
	'geoclue: geoinformation support'
	'crow-translate: translation provider'
	'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
	'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
	'xdg-desktop-portal: desktop integration'
)
provides=(yukigram-desktop)
conflicts=(yukigram-desktop)
install="${pkgname}.install"

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver//_/-}/binary-${CARCH}.tar.gz")
sha256sums=('396149b8bd648efabaecb65907dcf40cb59dc18c34320e50c7bf6ed403a948f0')
noextract=("${source[0]%%::*}")

prepare() {
	mkdir unpacked
	bsdtar -C unpacked -xf "${source[0]%%::*}"
}

package() {
	install -dm755 "${pkgdir}/usr"
	cp -a "${srcdir}/unpacked/." "${pkgdir}/usr/"
}
