# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-tmux/blob/main/.github/workflows/main.yml
_name=tree-sitter-tmux
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc="tmux grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$_name
depends=(python-tree-sitter)
makedepends=(uv python-installer)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('8c2a0781e6145753ed6cfbe152ceaecc2d5c7aa89195a61ef1d7b49532e7b725')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
