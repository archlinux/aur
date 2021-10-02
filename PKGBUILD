# Contributor: Spyros Stathopoulos <spystath@gmail.com>
pkgname=python2-pandas
_pkgname=pandas
pkgver=0.24.2
pkgrel=2
pkgdesc='R-like data analysis library for Python (final Python 2.x version).'
url='http://pandas.pydata.org'
depends=('python2' 'python2-numpy' 'python2-dateutil')
optdepends=('python2-numexpr: for accelerating certain numerical operations (recommended)'
            'python2-bottleneck: for accelerating certain types of nan evaluations (recommended)'
            'python2-scipy: for miscellaneous statistical functions'
            'python2-pytables: for HDF5-based storage'
            'python2-matplotlib: for plotting'
            'python2-openpyxl>=1.6.1: for Excel I/O'
            'python2-boto: for Amazon S3 access'
            'python2-beautifulsoup4: for read_html function'
            'python2-html5lib: for read_html function'
            'python2-lxml: for read_html function')
makedepends=('cython2' 'python2-setuptools')
arch=('i686' 'x86_64')
license=('BSD')
md5sums=('6640de14a934a701129b635c6d75801d')

source=("https://github.com/pandas-dev/pandas/releases/download/v${pkgver}/pandas-${pkgver}.tar.gz")

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  python2 setup.py build_ext --inplace
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python2-pandas/LICENSE
  python2 setup.py install --root=${pkgdir} --optimize=1
}

