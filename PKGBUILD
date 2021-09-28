# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_name=optimesh
pkgname=python-${_name}
pkgver=0.8.4
pkgrel=1
pkgdesc='Mesh optimization, mesh smoothing.'
url="https://github.com/nschloe/${_name}"
arch=('any')
license=('GPL3')
depends=(
	'python-meshplex'
	'python-numpy'
	'python-quadpy'
	'python-termplotlib'
	'python-npx'
)
optdepends=('python-matplotlib')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-codeblocks' 'python-matplotlib' 'python-meshzoo' 'python-dufte')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('65ddc506c091ae901f1616f2ee308e28c3ac33e4db6d9bc5280baaf1e60378ef81e183eeb68369eafda12fa095e5b2902b3cfbcb7dc7edcce6c40e0e5d30dcda')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
	cd "${_name}-${pkgver}"
	export PYTHONHASHSEED=0
	python -c 'from setuptools import setup; setup()' build
}

# check() {
# 	cd "${_name}-${pkgver}"
# 	python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
# 	PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
# }

package() {
	cd "${_name}-${pkgver}"
	python -c 'from setuptools import setup; setup()' install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
