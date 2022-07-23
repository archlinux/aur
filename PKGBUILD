# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=3.1
pkgrel=2
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://github.com/gkarsay/parlatype"
license=('GPL3')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'iso-codes')
makedepends=('appstream' 'appstream-glib' 'meson' 'gettext' 'gobject-introspection' 'yelp-tools' 'desktop-file-utils' 'gtk-doc')
optdepends=('parlatype-libreoffice-extension: LibreOffice macros')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('7227a7b725f0bdae75ecf30cbc6fd06085ece95be1c73fb8019cb66ca00e9c8a3fa31e99ff38869045cedcc7871a7fa23bb4cbbcb442d143d85ecab3407d038c')

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
