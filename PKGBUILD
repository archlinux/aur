# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname="python2-pandas-git"
pkgver=11964.e1ee171
pkgrel=1
pkgdesc="R-like data analysis library for Python."
url="http://pandas.pydata.org"
depends=('python2' 'python2-numpy' 'python2-dateutil')
optdepends=('python2-numexpr: for accelerating certain numerical operations (recommended)'
            'python2-bottleneck: for accelerating certain types of nan evaluations (recommended)'
            'python2-scipy: for miscellaneous statistical functions'
            'python2-pytables: for HDF5-based storage'
            'python2-matplotlib: for plotting'
            'scikits-statsmodels: for parts of pandas.stats'
            'python2-openpyxl>=1.6.1: for Excel I/O'
            'python2-xlrd: for Excel I/O'
            'python2-xlwt: for Excel I/O'
            'python2-boto: for Amazon S3 access'
            'python2-beautifulsoup4: for read_html function'
            'python2-html5lib: for read_html function'
            'python2-lxml: for read_html function')
makedepends=('git' 'cython2')
provides=('python2-pandas')
conflicts=('python2-pandas')
arch=('i686' 'x86_64')
license=('BSD')
md5sums=('SKIP')

_gitname="pandas"
source=("${_gitname}::git+git://github.com/pydata/pandas")

pkgver() {
  cd "${srcdir}"/"${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/${_gitname}"

  python2 setup.py build_ext --inplace
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python2-pandas/LICENSE
  python2 setup.py install --root=${pkgdir} --optimize=1
}

