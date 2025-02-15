# Maintainer: Carlos Galindo < arch -at- cgj _dot_ es >
# Contributor: Tomáš Mládek <t@mldk.cz>
pkgname=pdfbooklet
pkgver=3.1.2
pkgrel=4
pkgdesc="Utility to convert a PDF into a booklet, reordering pages."
arch=('any')
url="https://pdfbooklet.sourceforge.io"
license=('GPL-3.0-or-later')
depends=("python3" "python-cairo" "poppler-glib" "pango" "python-gobject" "gtk3" "gobject-introspection-runtime")
source=("https://sourceforge.net/projects/pdfbooklet/files/pdfbooklet%20$pkgver/$pkgname-$pkgver-all_64.tar.gz")
sha256sums=("f6171f34d2c7e922c5f1c9d03dec28e4ab706c1062ff39356e9f67be49e25ace")

prepare() {
	sed -r -i 's/^([ \t]*)(.*gettext\.bind_textdomain_codeset.*)$/\1# \2/' usr/lib/python3/dist-packages/pdfbooklet/elib_intl3.py
}

package() {
	mkdir -p $pkgdir/usr
	cp -r $srcdir/usr/bin $pkgdir/usr/bin
	cp -r $srcdir/usr/share $pkgdir/usr/share

	PYTHONDIR="$(python3 -c 'import sys; print(sys.path[-1])')"
	mkdir -p $pkgdir$PYTHONDIR
	cp -r $srcdir/usr/lib/python3/dist-packages/* -t $pkgdir$PYTHONDIR
}
