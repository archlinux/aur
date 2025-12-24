# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='vector'
pkgname="python-${_pkgname}"
pkgver=1.5.2
pkgrel=2
pkgdesc="A library for 2D, 3D, and Lorentz vectors, especially arrays of vectors, to solve common physics problems in a NumPy-like way."
arch=('any')
url='https://github.com/scikit-hep/vector'
license=('MIT')
depends=('python-numpy' 'python-packaging')
optdepends=('python-awkward: Awkward array support')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest' 'python-awkward' 'python-papermill' 'python-fsspec')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('8482d3e7750ee86fc68a18cf6248d03cb5e5259ec64a0591813252ab22a8166a')

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
