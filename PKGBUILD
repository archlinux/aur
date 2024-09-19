# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyspice
_name=PySpice
pkgver=1.5
pkgrel=0
epoch=
pkgdesc="Simulate electronic circuit using Python and the Ngspice / Xyce simulators"
arch=('any')
url="https://pypi.org/project/pyspace"
license=(GPL-3.0-only)
groups=()
provides=(${_name})
conflicts=(${_name})
_py_deps=(
    cffi
    beautifulsoup4
    regex
    requests
    invoke
    numpy
    matplotlib
    ply
    pygit2
    pygithub
    yaml)
depends=(
    python
    "${_py_deps[@]/#/python-}")
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools)
checkdepends=(python-pytest
    python-tox)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('d28448accad98959e0f5932af8736e90a1f3f9ff965121c6881d24cdfca23d22')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
