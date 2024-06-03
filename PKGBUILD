# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=4.2
pkgrel=1
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://github.com/gkarsay/parlatype"
license=('GPL3')
depends=('gtk4' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'iso-codes' 'libadwaita')
makedepends=('appstream' 'appstream-glib' 'meson' 'gettext' 'gobject-introspection' 'yelp-tools' 'desktop-file-utils' 'gtk-doc' 'cmake') # add pocketsphinx and/or deepspeech if needed
optdepends=('parlatype-libreoffice-extension: LibreOffice macros')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('04489f132b1e87d066b585fff2e22bd0234be45a39020b659a4be1c2f026c0931fdcccb15e3d0383a53c56be5414f3102b7da878c8c7583e2cb2726f3b75c100')

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
