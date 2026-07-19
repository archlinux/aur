# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-zathurarc/blob/main/.github/workflows/main.yml
_name=tree-sitter-zathurarc
pkgname=python-$_name
pkgver=0.1.1
pkgrel=1
pkgdesc="zathurarc grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$_name
depends=(python-tree-sitter)
makedepends=(uv python-installer)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('2adea97a62f662cdea4e19be8d35dfc6551cd8c862adbc140d3430a1efd101b7')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
