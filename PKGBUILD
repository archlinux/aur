# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=2.0
pkgrel=1
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://gkarsay.github.io/parlatype/"
license=('GPL')
depends=('gtk3' 'appstream' 'gst-plugins-base' 'gst-plugins-good' 'sphinxbase' 'pocketsphinx' 'python-atspi')
makedepends=('appstream-glib' 'meson' 'gettext' 'gobject-introspection' 'yelp-tools' 'desktop-file-utils')
optdepends=('libreoffice: LibreOffice macros' 'gst-plugins-ugly: Play MP3 files')
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
