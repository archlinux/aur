# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=1.6.2
pkgrel=1
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://gkarsay.github.io/parlatype/"
license=('GPL')
depends=('gtk3' 'appstream' 'gst-plugins-base' 'gst-plugins-good' 'sphinxbase' 'pocketsphinx' 'python-atspi')
makedepends=('libreoffice' 'appstream-glib' 'meson' 'yelp-tools')
optdepends=('libreoffice: LibreOffice macros' 'gst-plugins-ugly: Play MP3 files')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3362faffcee2bcec71ef2eb20362ade475983d3e89c20e7076ad10ddf7dace73')

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix=/usr
	cd build
	ninja
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir/" ninja install
}
