# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Philipp A <flying-sheep@web.de>
_base=umap
pkgname=python-${_base}-learn
pkgdesc="Uniform Manifold Approximation and Projection"
pkgver=0.5.3
pkgrel=1
arch=(any)
url="https://github.com/lmcinnes/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pynndescent python-tqdm)
makedepends=(python-setuptools)
# checkdepends=(python-pytest) # python-tensorflow python-nose
# optdepends=('python-pandas: for '
#   'python-matplotlib: for '
#   'python-datashader: for '
#   'python-bokeh: for '
#   'python-holoviews: for '
#   'python-colorcet: for '
#   'python-seaborn: for '
#   'python-scikit-image: for '
#   'python-tensorflow: for '
#   'python-tensorflow-probability: for ')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('9c0a1e91711340f802d69c8fb52bb44c0ed7e3358c6a95b27f0e6f11b13df81a965da5b4f2be67d94e6f0acc6e29ea053d0c6686c400a74654f2466a57122216')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

# check() {
#   cd ${_base}-${pkgver}
#   python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}"
#   python -m pytest -k 'not densmap_trustworthiness_on_iris_supervised'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
