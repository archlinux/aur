# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-markdown
_gitpkgname=tree-sitter-markdown
pkgver=0.5.3
pkgrel=1
pkgdesc='Python Bindings for tree-sitter-markdown'
arch=('x86_64')
url='https://github.com/tree-sitter-grammars/tree-sitter-markdown'
license=('MIT')
depends=(
	'python'
	"tree-sitter-markdown=${pkgver}"
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
	'fix_setup.py_expecting_other_layout.patch'
)

b2sums=('969e45c659a2ce808f8f35c494b7c81ce5ecf0d696aaaf46b8cf01eb13cc2fcad825607317627ed4c4d03d40539ff52cb44b90307b2d9da7483f7daad0bf9a07'
        '3122159a879874f82029a5176fac732df9aaab0aafbba77294cf3a41955f8737ad587da85b6d9af016fd8faeea9f782d3510a7cbc859dba955c02cda729d7c06')

prepare() {
	patch -Np1 < fix_setup.py_expecting_other_layout.patch
}

build() {
	python -m build --wheel --no-isolation
}

package() {
	python -I -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
