# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Philipp A <flying-sheep@web.de>
_base=umap
pkgname=python-${_base}-learn
pkgdesc="Uniform Manifold Approximation and Projection"
pkgver=0.5.1
pkgrel=1
arch=('any')
url="https://github.com/lmcinnes/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pynndescent python-tqdm)
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-nose python-tensorflow)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('66144217fdb70c6198465952ea34c9ff09c899d64de7ab60a90e57638ba999500c5a3ec4045689bcf8e5189faae0774bd32ca9ad1d5f1c3b9360986d7c7400cd')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
#   PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
# }

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
