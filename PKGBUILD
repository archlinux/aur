# Maintainer: Luís Fonseca <luispfonseca@gmail.com>
_pkgname=en-croissant

pkgname="${_pkgname}"-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="A Modern Chess Database"
arch=('x86_64')
url="https://github.com/franciscoBSalgueiro/en-croissant"
license=('GPL-3.0')
conflicts=("en-croissant")
depends=('hicolor-icon-theme' openssl-1.1
	pango
	webkit2gtk
	gtk3
	libsoup
	glib2
	cairo
	gcc-libs
	gdk-pixbuf2
	glibc
)

source_x86_64=("https://github.com/franciscoBSalgueiro/en-croissant/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('8f712dfb9419013abd685869572d2a623f2e9b4727df1c1e89bd58e888dd99c1')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir
	# https://github.com/tauri-apps/tauri/issues/8541
	find $pkgdir -name "*.desktop" -exec sed -i "s/Exec=.*/Exec=GDK_BACKEND=x11 en-croissant/g" {} \;
}
