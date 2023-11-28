# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=4.0
pkgrel=1
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://github.com/gkarsay/parlatype"
license=('GPL3')
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'iso-codes')
makedepends=('appstream' 'appstream-glib' 'meson' 'gettext' 'gobject-introspection' 'yelp-tools' 'desktop-file-utils' 'gtk-doc' 'cmake') # add pocketsphinx and/or deepspeech if needed
optdepends=('parlatype-libreoffice-extension: LibreOffice macros')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('9b32fb34977edd07d2b14891c8466163998820d6ac547e4727f9aef2beb67258417b9164c918e2c18f7ddb05017babfaca296b223a51c4f690c1f1df0b84a84b')

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
