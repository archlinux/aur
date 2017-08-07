# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype
pkgver=1.5.1
pkgrel=1
pkgdesc="GNOME audio player for transcription"
arch=('any')
url="https://gkarsay.github.io/parlatype/"
license=('GPL')
depends=('gtk3' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('gobject-introspection' 'libreoffice' 'yelp-tools' 'intltool' 'glade' 'gtk-doc')
optdepends=('libreoffice: LibreOffice macros')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1cc0847968911a27d9560d793635945bcc2cbf83a5e579c24c37c66c333da584')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf
	# Parlatype ships its own library, libparlatype. Developers might be interested in having a library documentation,
	# gobject introspection and a glade catalog for the widgets. These are the configure options:
	# --enable-gtk-doc: install library documentation (default: no)
	# --enable-introspection: install gobject introspection (default: yes)
	# --enable-glade-catalog: install a glade catalog (default: no)
	# --with-libreoffice: install LibreOffice macros (default: yes)
	# If you want the program only, you would use --prefix=/usr --disable-introspection.
	./configure --prefix=/usr --enable-gtk-doc --enable-glade-catalog
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
