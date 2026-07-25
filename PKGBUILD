# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/zathura-language-server/blob/main/.github/workflows/main.yml
pkgname=zathura-language-server
_name=$pkgname
pkgver=0.1.4
pkgrel=1
pkgdesc="zathura's language server"
arch=(any)
url=https://github.com/Freed-Wu/zathura-language-server
depends=(python-lsp-tree-sitter python-tree-sitter-zathurarc python-webcolors)
makedepends=(uv python-installer)
license=(GPL3)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('38e6dd7c586cc5a70864c5007c92c623bd8549d05d149e3ca6370b5dd90a6fa4')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
