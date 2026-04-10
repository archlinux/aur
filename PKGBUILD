# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-python
_gitpkgname=tree-sitter-python
pkgver=0.25.0
pkgrel=5
pkgdesc='Python Bindings for tree-sitter-python'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-python'
license=('MIT')
depends=(
	'python'
	"tree-sitter-python=${pkgver}"
	'python-tree-sitter'
	'tree-sitter'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
checkdepends=(
	'python-pytest'
	'python-tree-sitter'
)

source=(
	"${_gitpkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_gitpkgname}.tar.gz"
)

b2sums=('be114cb3dd199a44b358a780ee509ab112581e976eac032685f17b813cf381a16f9d9253b90ab28fe08a854b495c849fdfdd99f3f6a4687844074b49814960ac')

build() {
	python -m build --wheel --no-isolation
}

package() {
	python -I -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
