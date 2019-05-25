# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-moods
_pkgname=MOODS
pkgver=1.9.4.1
pkgrel=1
pkgdesc="Motif Occurrence Detection Suite"
arch=('any')
url=https://github.com/jhkorhonen/MOODS
license=('Biopython')
depends=('python')
makedepends=('python-setuptools' 'swig')
source=("https://github.com/jhkorhonen/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f7f522f341b99473d4aa0f95fdfcaef65d9d83866c7da3894c405b2ac14a4ae4')

build() {
  cd "$srcdir/$_pkgname-$pkgver/python"
  ln -sf ../core
  swig -c++ -python -outdir MOODS/ core/scan.i
  swig -c++ -python -outdir MOODS/ core/tools.i
  swig -c++ -python -outdir MOODS/ core/misc.i
  swig -c++ -python -outdir MOODS/ core/parsers.i
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver/python"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
