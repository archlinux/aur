# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-typescript
_gitpkgname=tree-sitter-typescript
pkgver=0.23.2
pkgrel=1
pkgdesc='Python Bindings for tree-sitter-typescript'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-typescript'
license=('MIT')
depends=(
	'python'
	"tree-sitter-typescript=${pkgver}"
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
	"${_gitpkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_gitpkgname}.tar.xz"
)

b2sums=('8f62dd7c42c950a5ecb8ad75e96346ea2676b9046888e4acd823fa9b485f0b2ac292e9134afa6482ab316da68a14a7a588c3339aa3b1a676406a98c54b3147dd')

build() {
	python -m build --wheel --no-isolation
}

package() {
	python -I -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
