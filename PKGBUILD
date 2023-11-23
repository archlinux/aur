# Maintainer: Paolo Palmieri <palmaway@gmx.it>
# Contributor: David Mehren <david.mehren@udo.edu>
pkgname=sdaps
pkgver=1.9.13
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

source=("https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('bbdb37d92a75e87e845d0e99ea7bdcb46d629168f8595324d2750e76fb59b4c6')

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
