# Maintainer: Paolo Palmieri <palmaway@gmx.it>
# Contributor: David Mehren <david.mehren@udo.edu>
pkgname=sdaps
pkgver=1.9.11
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
makedepends=('python-pkgconfig')
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

source=('https://github.com/sdaps/sdaps/archive/refs/tags/v1.9.11.tar.gz')
sha1sums=('19bd8aa81bada3f1cb274a94fb80639dd8fa813a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$srcdir/$pkgname-$pkgver/test"
	./run-test-locally.sh
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -p $pkgdir/usr/share/texmf/tex/latex/sdaps
	cp $pkgdir/usr/share/sdaps/tex/* $pkgdir/usr/share/texmf/tex/latex/sdaps
}
