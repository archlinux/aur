# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-javascript
_gitpkgname=tree-sitter-javascript
pkgver=0.25.0
pkgrel=1
pkgdesc='Python Bindings for tree-sitter-javascript'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-javascript'
license=('MIT')
depends=(
	'python'
	'tree-sitter-javascript'
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

b2sums=('942f7f6832754248f9011d89aef3a05021d5fc3adef5416a796afb6ff2e15b86ffa97cc6fe7078c2b61e7bc62ea50bb8675714b87283eddab751b943d13d5973')

build() {
	python -m build --wheel --no-isolation
}

package() {
	python -I -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
