# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=4.1
pkgrel=2
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://github.com/gkarsay/parlatype"
license=('GPL3')
depends=('gtk4' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'iso-codes' 'libadwaita')
makedepends=('appstream' 'appstream-glib' 'meson' 'gettext' 'gobject-introspection' 'yelp-tools' 'desktop-file-utils' 'gtk-doc' 'cmake') # add pocketsphinx and/or deepspeech if needed
optdepends=('parlatype-libreoffice-extension: LibreOffice macros')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('6554c3702bb36da7c1242c783fa555b446c573a71a5cb862c4ac9dbae6f1cf6d3c9c880abce24f300fa932f88111646b55f16e7175b73e1c6a072810a0d68ddf')

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Dgir=true -Dgtk-doc=true # add -Dpocketsphinx=true and/or -Ddeepspeech=true if needed
	cd build
	ninja
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir/" ninja install
}
