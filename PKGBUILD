# Maintainer: Bet4 <bet4it@gmail.com>
# Contributor: Avery Warddhana <them+arch _ nullablevo id au>

pkgname=python-fx
pkgver=0.3.1
pkgrel=1
pkgdesc=" A python-native JSON Viewer TUI"
url='https://github.com/cielong/pyfx'
arch=('any')
license=('MIT')
makedepends=('antlr4')
depends=('python-antlr4' 'python-asciimatics' 'python-click'
		'python-dacite' 'python-first' 'python-jsonpath-ng'
		'python-loguru' 'python-overrides' 'python-pillow'
		'python-ply' 'python-pyfiglet' 'python-pyperclip'
		'python-yaml' 'python-urwid' 'python-wcwidth'
		'python3-yamale')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('76044ba32195b8e0ce444aa714981cb1481f9df44c3381c5ed4b43a4f6812c73')

build() {
    cd "${pkgname}-${pkgver}"

    pushd src/pyfx/model/common/jsonpath/
        antlr4 -Dlanguage=Python3 JSONPath.g4
    popd

    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set et sw=4 sts=4:
