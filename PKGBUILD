# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>
# Contributor: Fabio Zanini <fabio.zanini _at_ stanford.edu>

pkgname='python-pysam'
_name='pysam'
pkgver=0.16.0.1
pkgrel=1
pkgdesc="Python interface for the SAM/BAM sequence alignment and mapping format"
arch=('x86_64')
url="https://github.com/pysam-developers/pysam"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cython' 'htslib')
provides=('python-pysam')
options=(!emptydirs)
install=
source=("https://github.com/pysam-developers/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('a61e98e299fa93ba121aab521081282b61bc978bb9052d33b26b38f8fe15573e')

build() {
  cd "$srcdir/$_name-$pkgver"

  export HTSLIB_LIBRARY_DIR=/usr/lib
  export HTSLIB_INCLUDE_DIR=/usr/include

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
