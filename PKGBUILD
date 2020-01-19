# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: David Scholl <djscholl at gmail dot com>

_module="tablib"
pkgname="python-${_module}"
pkgver=1.0.0
pkgrel=2
pkgdesc="Format-agnostic tabular data library (XLS, JSON, YAML, CSV)"
arch=("any")
url="http://python-tablib.org"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
checkdepends=("python-pytest")
optdepends=("python-tabulate: cli interface"
            "python-markuppy: for HTML support"
            "python-odfpy: for ODS support"
            "python-pandas: for pandas support"
            "python-xlrd: for XLS support (extract data)"
            "python-xlwt: for XLS support (create spreadsheets)"
            "python-openpyxl: for XLSX support"
            "python-pyaml: for YAML support")
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz)
sha256sums=('ff3172802e8dd7fb795867942f5238f6c90e2d4e90ad6233c1a796cdfc63bb35')


build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

check() {
    cd "${_module}-${pkgver}"
    PYTHONPATH="$PWD/build/lib:$PYTHONPATH" py.test
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 "${srcdir}/${_module}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
