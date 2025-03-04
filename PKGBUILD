# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-exspy
pkgshort=exspy
pkgver=0.3.2
pkgrel=1
pkgdesc="Analysis of EDS and EELS data with HyperSpy"
arch=('any')
url="http://hyperspy.org/exspy"
license=('GPL-3.0-or-later')

depends=('python'
         'python-dask'
         'python-hyperspy>=2.3.0'
         'python-matplotlib'
         'python-numpy'
         'python-pint'
         'python-pooch'
         'python-prettytable'
         'python-requests'
         'python-scipy'
         'python-traits'
         )

optdepends=('python-hyperspy-gui-ipywidgets>=2.1.0: GUI components for Jupyter' # AUR
            'python-hyperspy-gui-traitsui>=2.1.0: GUI components for desktop'  # AUR
            'python-numexpr: speed'
             )


makedepends=('python-setuptools>=64'
             'python-setuptools-scm>=8'
             'python-wheel'
             'python-build'
             'python-installer'
             )

checkdepends=('python-pytest>=5.0'
              'python-pytest-cov>=2.8.1'
              'python-pytest-mpl'
              'python-pytest-xdist'
             )

provides=('exspy')

source=(https://github.com/hyperspy/$pkgshort/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('d376e34dd9e21b7bde94bd7f23d4aa8d')
