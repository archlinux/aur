# Contributor: Tomas Ostasevicius <t dot ostasevicius at gmail dot com>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Joshua Taillon <jat255 AT gmail DOT com>
pkgname=python-hyperspy
pkgshort=hyperspy
pkgver=2.3.0
pkgrel=1
pkgdesc="Hyperspectral data analysis"
arch=('any')
url="http://hyperspy.org"
license=('GPL-3.0-or-later')

depends=('python<13'
         'python-cloudpickle'
         'python-dask>=2022.9.2'
         'python-importlib-metadata>=3.6'
         'python-jinja'
         'python-matplotlib>=3.6'
         'python-natsort'
         'python-numpy>=1.20.0'
         'python-packaging'
         'python-pint>=0.10'
         'python-prettytable>=2.3'
         'python-yaml'
         'python-rosettasciio'
         'python-scipy>=1.6.0'
         'python-sympy>=1.10'
         'python-tqdm>=4.59.0'
         'python-traits>=4.5.0'
         'python-scikit-image>=0.18'  # AUR
         )

optdepends=('python-numba>=0.53: speed'  # AUR
            'python-numexpr>=2.8: speed'
            'ipython: ipython>8.0'
            'python-ipyparallel: ipython' # AUR, 
            'python-scikit-learn>=1.0.1: machine learning features'
            'python-hyperspy-gui-ipywidgets>=2.1.0: GUI components for Jupyter' # AUR
            'python-ipympl: GUI components for Jupyter'
            'python-hyperspy-gui-traitsui>=2.1.0: GUI components for desktop'  # AUR
             )

makedepends=('python-setuptools>=64'
             'python-setuptools-scm>=8'
             'python-wheel'
             'python-build'
             'python-installer'
             )

checkdepends=('python-pooch'
              'python-pytest>=3.6'
              'python-pytest-cov'
              'python-pytest-mpl'
              'python-pytest-rerunfailures'
              'python-pytest-xdist'
              'python-setuptools-scm'
               )

replaces=('hyperspy')
conflicts=('hyperspy')
provides=('hyperspy')

source=(https://github.com/hyperspy/hyperspy/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

md5sums=('4cbd6653b7a87333f470491637eb67e1')
