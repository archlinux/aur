# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
# Maintainer: Liam Timms <timms5000@gmail.com>

pkgname=python-nilearn
pkgver=0.10.3
pkgrel=1
pkgdesc="Python library for fast and easy statistical learning on NeuroImaging data"
arch=('any')
url="http://nilearn.github.io/"
license=('BSD')
# see https://github.com/nilearn/nilearn/blob/main/setup.cfg	
depends=('python-lxml'
         'python-joblib>=1.0.0'
         'python-scipy>=1.6.0' 
         'python-numpy>=1.19.0' 
         'python-pandas>=1.1.5' 
         'python-scikit-learn>=1.0.0' 
         'python-nibabel>=3.2.0'
         'python-statsmodels')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-matplotlib: for general plotting'
            'python-plotly: for surface plotting'
            'python-kaleido: required if using plotly')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nilearn/nilearn/archive/${pkgver}.tar.gz")
sha256sums=('e71734179c79c0886b65497a5d4f7997b1e9eeb170e36f6dfd46c4fe9b95415c')

build() {
  cd "$srcdir"/nilearn-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  # python setup.py build
  python -m build --wheel --no-isolation

}

package() {
  cd "$srcdir"/nilearn-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  # python setup.py install --root="$pkgdir"/ --optimize=1
  python -m installer --destdir="$pkgdir" dist/*.whl
}

