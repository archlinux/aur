# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-autoconf/blob/main/.github/workflows/main.yml
_name=tree-sitter-autoconf
pkgname=python-$_name
pkgver=0.0.1
pkgrel=1
pkgdesc="autoconf grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$_name
depends=(python-tree-sitter)
makedepends=(uv python-installer python-setuptools)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('bb4e112d94f2096b24d51b21cadca50eefd3943a2f879e96b20c616f258e6fa0')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
