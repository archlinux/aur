# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=2.0
pkgrel=3
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://github.com/gkarsay/parlatype"
license=('GPL')
# Automatic speech recognition is recommendend to be turned off by developper
# If you want ASR, add 'sphinxbase' 'pocketsphinx' 'python-atspi' as dependencies
# and -Dasr=true in the build command
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('appstream' 'appstream-glib' 'meson' 'gettext' 'gobject-introspection' 'yelp-tools' 'desktop-file-utils')
optdepends=('parlatype-libreoffice-extension: LibreOffice macros')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f9833d244f8744f7a9983d680005462d02d062c2538423cb443279da2cc5e2d1')

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix=/usr -Dasr=false -Dgir=true
	cd build
	ninja
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir/" ninja install
}
