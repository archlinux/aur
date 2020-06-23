# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=2.1
pkgrel=1
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://github.com/gkarsay/parlatype"
license=('GPL3')
# Automatic speech recognition is recommendend to be turned off by developper
# If you want ASR, add 'sphinxbase' 'pocketsphinx' 'python-atspi' as dependencies
# and -Dasr=true in the build command
depends=('gtk3' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('appstream' 'appstream-glib' 'meson' 'gettext' 'gobject-introspection' 'yelp-tools' 'desktop-file-utils')
optdepends=('parlatype-libreoffice-extension: LibreOffice macros')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('13f1f2895a3ae5bb8809bfd0608baa84138e81388d5648577aface7c808aebf6')

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
