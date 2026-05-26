# Contributor: Jonas Lähnemann <jonas at pdi-berlin dot de>
# Maintainer: Jonas Lähnemann <jonas at pdi-berlin dot de>
pkgname=python-kikuchipy
pkgshort=kikuchipy
pkgver=0.12.0
pkgrel=1
pkgdesc="Processing and analysis of electron backscatter diffraction (EBSD) patterns."
arch=('any')
url="https://kikuchipy.org/"
license=('GPL-3.0-or-later')

depends=('python'
	 'python-dask>=2021.8.1'
	 'python-diffpy.structure>=3'
         'python-diffsims>=0.5.2'
         'python-hyperspy>=2.2'
	 'python-h5py>=2.10'
	 'python-imageio'
         'python-lazy-loader'
         'python-matplotlib>=3.6'
         'python-numba>=0.57'
	 'python-numpy>=1.23.0'
	 'python-orix>=0.12.1'
         'python-pyyaml'
         'python-rosettasciio>=0.3.0'
         'python-scikit-image>=0.16.2'
         'python-scikit-learn'
         'python-scipy>=1.7'
         'python-tqdm>=0.5.2'
         )

makedepends=('python-setuptools>=64'
             'python-setuptools-scm>=8'
             'python-wheel'
             'python-build'
             'python-installer'
             )

optdepends=('python-pooch>=1.3.0: download test data'
	    'python-pyvista: visualization',
            'python-pyebsdindex>=0.3.2: orientation indexing',
	    'python-psygnal: triggering actions based on state changes',
	    'python-ipywidgets: gui widgets',
	    'ipython: gui widgets',
	    )

provides=('kikuchipy')

source=(https://github.com/pyxem/kikuchipy/archive/v$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgshort-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgshort-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('20ee9575d171a537bf0d862f81355528a7791e5e3f25b228eb52c06fe1d1d36c')
