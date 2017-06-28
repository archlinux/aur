# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=1.5
pkgrel=2
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://gkarsay.github.io/parlatype/"
license=('GPL')
depends=('gtk3' 'intltool' 'gobject-introspection-runtime' 'yelp-tools' 'gst-plugins-base' 'gst-plugins-good' 'libreoffice')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('8de6ae7bb0f261b4f48effbe133684c5')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf
	./configure --prefix=/usr --disable-introspection
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
