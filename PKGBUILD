# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tmux-language-server/blob/main/.github/workflows/main.yml
pkgname=tmux-language-server
_name=$pkgname
pkgver=0.1.2
pkgrel=1
pkgdesc="tmux's language server"
arch=(any)
url=https://github.com/Freed-Wu/tmux-language-server
depends=(python-lsp-tree-sitter python-tree-sitter-tmux)
makedepends=(uv python-installer)
license=(GPL3)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('333b69c75be1e7efd27c77e3e7e018d03f0dc102d21857009bb6b0e6be52e803')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
