# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Philipp A <flying-sheep@web.de>
_base=umap
pkgname=python-${_base}-learn
pkgdesc="Uniform Manifold Approximation and Projection"
pkgver=0.5.2
pkgrel=2
arch=('any')
url="https://github.com/lmcinnes/${_base}"
license=('custom:BSD-3-clause')
depends=(python-pynndescent python-tqdm)
makedepends=(python-setuptools)
# checkdepends=(python-pytest python-nose python-tensorflow)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('cddbb53dd85d65d555e7842bd4f7a2706e0e5cb1f0df7d694b3b403bbeee7b6fd973ed77e76352f8913622bfbafae8a992227485c0af2572153a64a7d891991f')

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
