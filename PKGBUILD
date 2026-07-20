# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_name=tree-sitter-bash
pkgname=python-$_name
pkgver=0.25.1
pkgrel=1
pkgdesc="bash grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/tree-sitter/tree-sitter-bash
depends=(python-tree-sitter)
makedepends=(python-installer)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('bfc0bdaa77bc1e86e3c6652e5a6e140c40c0a16b84185c2b63ad7cd809b88f14')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
