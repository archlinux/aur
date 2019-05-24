# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=1.6
pkgrel=1
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://gkarsay.github.io/parlatype/"
license=('GPL')
depends=('gtk3' 'appstream' 'gst-plugins-base' 'gst-plugins-good' 'sphinxbase' 'pocketsphinx' 'python-atspi')
makedepends=('libreoffice' 'appstream-glib' 'meson' 'yelp-tools')
optdepends=('libreoffice: LibreOffice macros' 'gst-plugins-ugly: Play MP3 files')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8150aab04988b6966863f8c42fbab7a8d096b52c859929a819b19ef307f878b9')

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
