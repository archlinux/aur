# Maintainer: RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-tree-sitter-json
_gitpkgname=tree-sitter-json
pkgver=0.24.8
pkgrel=2
pkgdesc='Python Bindings for tree-sitter-json'
arch=('x86_64')
url='https://github.com/tree-sitter/tree-sitter-json'
license=('MIT')
depends=(
	'python'
	"tree-sitter-json=${pkgver}"
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
	"${_gitpkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_gitpkgname}.tar.xz"
)

b2sums=('0a1986c65e99d58eef6bfecd55adfb15099a3a0a00bc902aa8be2fe00f7ff14f2a21198bf1e277cf3166c1caeababd32a4a1d2fb06eb98e8d8156749d1a9f2c5')

build() {
	python -m build --wheel --no-isolation
}

package() {
	python -I -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
