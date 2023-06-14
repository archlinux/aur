# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: David Scholl <djscholl at gmail dot com>

_module="tablib"
pkgname="python-${_module}"
pkgver=3.5.0
pkgrel=1
pkgdesc="Format-agnostic tabular data library (XLS, JSON, YAML, CSV)"
arch=("any")
url="http://python-tablib.org"
license=("MIT")
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
checkdepends=("python-pytest-cov" "python-tabulate" "python-markuppy"
              "python-odfpy" "python-pandas" "python-xlrd"
              "python-xlwt" "python-openpyxl" "python-pyaml")
optdepends=("python-tabulate: cli interface"
            "python-markuppy: for HTML support"
            "python-odfpy: for ODS support"
            "python-pandas: for pandas support"
            "python-xlrd: for XLS support (extract data)"
            "python-xlwt: for XLS support (create spreadsheets)"
            "python-openpyxl: for XLSX support"
            "python-pyaml: for YAML support")
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz)
sha256sums=('f6661dfc45e1d4f51fa8a6239f9c8349380859a5bfaa73280645f046d6c96e33')


build() {
    cd "${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_module}-${pkgver}"
    PYTHONPATH="$PWD/build/lib:$PYTHONPATH" py.test
}

package() {
    cd "${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 "${srcdir}/${_module}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
