# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/tree-sitter-muttrc/blob/main/.github/workflows/main.yml
_name=tree-sitter-muttrc
pkgname=python-$_name
pkgver=0.1.1
pkgrel=1
pkgdesc="muttrc grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/neomutt/$_name
depends=(python-tree-sitter)
makedepends=(uv python-installer python-setuptools)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('81bee42299c7569b85dad1e36cf2c3b6a7985255d1860936f9b3a7859f45ea38')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
