# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-exspy
pkgshort=exspy
pkgver=0.3.1
pkgrel=2
pkgdesc="Analysis of EDS and EELS data with HyperSpy"
arch=('any')
url="http://hyperspy.org/exspy"
license=('GPL3')

depends=('python'
         'python-dask'
         'python-hyperspy>=2.0rc0'
         'python-matplotlib'
         'python-numexpr' # speed
         'python-numpy'
         'python-pint'
         'python-pooch'
         'python-prettytable'
         'python-requests'
         'python-scipy'
         'python-traits'
         )

optdepends=('python-hyperspy-gui-ipywidgets>=2.0: GUI components for Jupyter' # AUR
            'python-hyperspy-gui-traitsui>=2.0: GUI components for desktop'  # AUR
             )


makedepends=('python-setuptools>=64'
             'python-setuptools-scm>=8'
             'python-wheel'
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

md5sums=('ee1cfb3c28bfd93cf95a9213db38e959')
