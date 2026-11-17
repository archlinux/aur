# Maintainer: Elk Cloner <dev [at] elkcl [dot] ru>

pkgname=yukigram-bin
pkgver=7.4.4.0
pkgrel=1
pkgdesc="Unofficial patch-based Telegram Desktop fork — minus the bullshit, plus the features"
arch=(x86_64)
url="https://github.com/yukigram/yukigram"
license=('GPL-3.0-or-later WITH sqlitestudio-OpenSSL-exception')
depends=(glibc fontconfig glib2 hicolor-icon-theme freetype2 pango cairo)
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
sha256sums=('3d2c74dab34d009e1e12bac1b8070babb84478825e5ae986f536d4162a41e3c0')
noextract=("${source[0]%%::*}")

prepare() {
	mkdir -p unpacked
	bsdtar -C unpacked -xf "${source[0]%%::*}"
}

package() {
	install -dm755 "${pkgdir}/usr"
	cp -a "${srcdir}/unpacked/." "${pkgdir}/usr/"
	ln -s ./io.github.yukigram "${pkgdir}/usr/bin/yukigram"
}
