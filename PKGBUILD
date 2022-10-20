# Maintainer: Avery Warddhana <nullableVoidPtr+arch _ gmail>

pkgname=python-fx
pkgver=0.1.0
pkgrel=1
pkgdesc=" A python-native JSON Viewer TUI "
url='https://github.com/cielong/pyfx'
arch=('any')
license=('GPL2')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-antlr4' 'python-asciimatics' 'python-click'
		'python-dacite' 'python-first' 'python-jsonpath-ng'
		'python-loguru' 'python-overrides' 'python-pillow'
		'python-ply' 'python-pyfiglet' 'python-pyperclip'
		'python-yaml' 'python-urwid' 'python-wcwidth'
		'python3-yamale')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('861118cd69eaca8803d01352fc3e861f17073f57961aa682ac2875321de34f07')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=4 sts=4:
