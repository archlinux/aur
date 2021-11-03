# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=3.0
pkgrel=1
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://github.com/gkarsay/parlatype"
license=('GPL3')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'iso-codes')
makedepends=('appstream' 'appstream-glib' 'meson' 'gettext' 'gobject-introspection' 'yelp-tools' 'desktop-file-utils' 'gtk-doc')
optdepends=('parlatype-libreoffice-extension: LibreOffice macros')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('27d9c395d2bbd16544d4604b7c722ac68a67a07c06936dae9f1161a034e26bd4')

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Dgir=true -Dgtk-doc=true
	cd build
	ninja
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir/" ninja install
}
