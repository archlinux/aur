# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: David Scholl <djscholl at gmail dot com>

_module="tablib"
pkgname="python-${_module}"
pkgver=3.11.0
pkgrel=1
pkgdesc="Format-agnostic tabular data library (XLS, JSON, YAML, CSV)"
arch=("any")
url="https://tablib.readthedocs.io/en/stable/"
license=("MIT")
depends=(python)
makedepends=(git python-build python-installer python-wheel python-setuptools-scm)
checkdepends=("python-pytest-cov" "python-tabulate"
              "python-odfpy" "python-pandas" "python-xlrd"
              "python-xlwt" "python-openpyxl" "python-pyaml")
optdepends=("python-tabulate: cli interface"
            "python-odfpy: for ODS support"
            "python-pandas: for pandas support"
            "python-xlrd: for XLS support (extract data)"
            "python-xlwt: for XLS support (create spreadsheets)"
            "python-openpyxl: for XLSX support"
            "python-pyaml: for YAML support")
source=(git+https://github.com/jazzband/tablib.git#tag=v${pkgver})
sha256sums=('f2fb99c4b659c3a8b93c468197f799f77134212c726d6756780876e7e1c3ed52')


build() {
    cd "${_module}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_module}"
    PYTHONPATH="$PWD/build/lib:$PYTHONPATH" py.test
}

package() {
    cd "${_module}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
