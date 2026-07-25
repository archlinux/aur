# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-zathurarc/blob/main/.github/workflows/main.yml
_name=tree-sitter-zathurarc
pkgname=python-$_name
pkgver=0.1.6
pkgrel=1
pkgdesc="zathurarc grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$_name
depends=(python-tree-sitter)
makedepends=(uv python-installer python-setuptools)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('5f30cba84c7dafc2f8f7443fe1cdec96bc29bc3e10be3937a5f66936293026e7')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
