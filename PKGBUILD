# Maintainer: Paolo Palmieri <palmaway@gmx.it>
# Contributor: David Mehren <david.mehren@udo.edu>
pkgname=sdaps
pkgver=1.9.12
pkgrel=1
pkgdesc="Scripts for data acquisition with paper based surveys"
arch=('any')
url="https://github.com/sdaps/sdaps"
license=('GPL3' 'LPPLv1.3c+')
depends=('python-setuptools'
         'python-cairo'
         'libtiff'
         'zbar'
         'texlive-latexextra'
         'texlive-pictures'
         'texlive-science')
makedepends=('meson')
optdepends=('python-pillow: reportlab based reports (report)'
            'python-reportlab: reportlab based reports (report)'
            'opencv: Import of other image formats (convert, add --convert)'
            'python-opencv: Import of other image formats (convert, add --convert)'
            'poppler-glib: Import of other image formats (convert, add --convert)'
            'hdf5: Import of other image formats (convert, add --convert)'
            'python-numpy: Import of other image formats (convert, add --convert)'
            'python-gobject: Graphical user interface, import of other image formats (convert, add --convert)'
            'python-pandas: Export to feather format'
            'python-pyarrow: Export to feather format'
)
checkdepends=('python-pillow'
              'python-reportlab'
              'opencv'
              'python-opencv'
              'poppler-glib'
              'hdf5'
              'python-numpy'
              'python-gobject'
)
conflicts=('sdaps-git')

source=('https://github.com/sdaps/sdaps/releases/download/v1.9.12/sdaps-1.9.12.tar.xz')
sha256sums=('1f4723946ecf17d5a9e40ff3a42010d6dff46ad67a6592fc6668268fd3d3ccf0')

build() {
	arch-meson $pkgname-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
	mkdir -p $pkgdir/usr/share/texmf/tex/latex/sdaps
	cp $pkgdir/usr/share/sdaps/tex/* $pkgdir/usr/share/texmf/tex/latex/sdaps
}
