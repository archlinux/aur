# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/lsp-tree-sitter/blob/main/.github/workflows/main.yml
_name=lsp-tree-sitter
pkgname=python-$_name
pkgver=0.2.12
pkgrel=1
pkgdesc="a library to create language servers"
arch=(any)
url=https://github.com/neomutt/$_name
depends=(python-jq python-jsonschema python-pygls python-tree-sitter)
optdepends=(python-colorama python-beautifulsoup4 python-pypandoc python-markdown-it-py python-pygments python-platformdirs python-yaml python-tomli-w)
makedepends=(uv python-installer)
replaces=(python-tree-sitter-lsp)
license=(GPL3)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a6343c4e20466a457a85762ba7471ddd98b742a4d90f7802748f76ab987c4647')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
