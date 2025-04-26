# Maintainer: Bet4 <bet4it@gmail.com>
# Contributor: Avery Warddhana <them+arch _ nullablevo id au>

pkgname=python-fx
pkgver=0.3.2
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
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('9646f58c716e2db6698bff3dfa55fa721b8b0cb741506287a87bc08055a96ceb')

build() {
    cd "${pkgname//-/_}-${pkgver}"

    pushd src/pyfx/model/common/jsonpath/
        antlr4 -Dlanguage=Python3 JSONPath.g4
    popd

    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname//-/_}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set et sw=4 sts=4:
