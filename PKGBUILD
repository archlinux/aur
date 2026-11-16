# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=kipart
pkgver=2.8.0
pkgrel=1
pkgdesc="Utilities for converting rows of CSV pin data into KiCad symbols and back"
url="https://github.com/devbisme/kipart"
depends=(
	'python'
	'python-openpyxl'
	'python-pandas'
	'python-rich'
	'python-simp-sexp'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
optdepends=('python-fastmcp: MCP server (kipart-mcp)')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('aa337f0943667c2ca16adff66bc428b3eb6de4637b5b1b9f540f9200a269765d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# https://wiki.archlinux.org/title/Python_package_guidelines
	rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}
