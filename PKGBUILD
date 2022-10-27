# Maintainer: Avery Warddhana <nullableVoidPtr+arch _ gmail>

pkgname=python-fx
pkgver=0.2.0
pkgrel=1
pkgdesc=" A python-native JSON Viewer TUI"
url='https://github.com/cielong/pyfx'
arch=('any')
license=('GPL2')
makedepends=('python-build' 'python-installer' 'python-wheel' 'antlr4')
checkdepends=('python-pytest')
depends=('python-antlr4' 'python-asciimatics' 'python-click'
		'python-dacite' 'python-first' 'python-jsonpath-ng'
		'python-loguru' 'python-overrides' 'python-pillow'
		'python-ply' 'python-pyfiglet' 'python-pyperclip'
		'python-yaml' 'python-urwid' 'python-wcwidth'
		'python3-yamale')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('82866a06ff890fe7f741648be95e1ad4121c19bca73dd5cee69666d04c39e5e5')

prepare() {
    cd "${pkgname}-${pkgver}"

    cd src/pyfx/model/common/jsonpath/
    antlr4 -Dlanguage=Python3 JSONPath.g4
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "${pkgname}-${pkgver}"
#     pytest
# }

package() {
    cd "${pkgname}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=4 sts=4:
