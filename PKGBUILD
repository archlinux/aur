# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>
_base=optimesh
pkgname=python-${_base}
pkgdesc="Mesh optimization, mesh smoothing"
pkgver=0.8.5
pkgrel=1
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-quadpy python-termplotlib)
makedepends=(python-setuptools)
# checkdepends=(python-dufte python-meshzoo python-pytest-codeblocks)
optdepends=('python-matplotlib: for Matplotlib rendering')
provides=('optimesh' 'optimesh-info')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ce96eaf6e340214838a869ac26c00fb5320686ed1a48a0b99de92e1d6233f797263aa141c25a24990038ca37a3448a05b7568cf4ac99c62b571aa1bf3954d127')

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
