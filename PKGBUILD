# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optimesh
pkgname=python-${_base}
pkgdesc="Mesh optimization, mesh smoothing"
pkgver=0.8.4
pkgrel=3
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-quadpy python-termplotlib)
makedepends=(python-setuptools)
# checkdepends=(python-dufte python-meshzoo python-pytest-codeblocks)
optdepends=('python-matplotlib: for Matplotlib rendering')
provides=('optimesh' 'optimesh-info')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('c700f9784c0a12f6f8f133544e18057c4f084a6532ac74f66bbb9d272dfcf98f7f4bbb5ea62b41fc24d3a385ae6a1bb6b31ad40394ea5f1ed747f7f7fca8d5d4')

build() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -c 'from setuptools import setup; setup()' build
}

# check() {
# 	cd "${_base}-${pkgver}"
# 	python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
# 	PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c 'from setuptools import setup; setup()' install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
