# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='vector'
pkgname="python-${_pkgname}"
pkgver='0.11.0'
pkgrel=3
pkgdesc="A library for 2D, 3D, and Lorentz vectors, especially arrays of vectors, to solve common physics problems in a NumPy-like way."
arch=('any')
url='https://github.com/scikit-hep/vector'
license=('MIT')
depends=('python-numpy' 'python-packaging' 'python-importlib-metadata' 'python-typing-extensions')
optdepends=('python-awkward: Awkward array support')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest' 'python-awkward' 'python-papermill')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

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
