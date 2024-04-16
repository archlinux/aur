# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='vector'
pkgname="python-${_pkgname}"
pkgver='1.3.1'
pkgrel=1
pkgdesc="A library for 2D, 3D, and Lorentz vectors, especially arrays of vectors, to solve common physics problems in a NumPy-like way."
arch=('any')
url='https://github.com/scikit-hep/vector'
license=('MIT')
depends=('python-numpy' 'python-packaging' 'python-importlib-metadata' 'python-typing_extensions')
optdepends=('python-awkward: Awkward array support')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest' 'python-awkward' 'python-papermill' 'python-fsspec')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('1d7ef92dea86f177ec2088bcf5d5bbef9961bcf14ab09755a0d1883017fbd57e')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}"
  PYTHONPATH="${PWD}/build/lib:${PWD}/src" pytest -k 'not test_intro'
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
