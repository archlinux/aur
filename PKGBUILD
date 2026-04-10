# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-rust
_gitpkgname=tree-sitter-rust
pkgver=0.24.2
pkgrel=1
pkgdesc='Python Bindings for tree-sitter-rust'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-rust'
license=('MIT')
depends=(
	'python'
	"tree-sitter-rust=${pkgver}"
	'python-tree-sitter'
	'tree-sitter'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)

source=(
	"${_gitpkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_gitpkgname}.tar.gz"
)

b2sums=('7a88632b7bc359f7a15e80e88d5b357f3509fcc75e5527f539e80391cda14499df545af56f375dd162eea51b619488950e0e0342f29bd2007cf6f8e18ac73d10')

build() {
	python -m build --wheel --no-isolation
}

package() {
	python -I -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
