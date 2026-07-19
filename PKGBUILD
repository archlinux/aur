# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/tree-sitter-muttrc/blob/main/.github/workflows/main.yml
_name=tree-sitter-muttrc
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc="muttrc grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/neomutt/$_name
depends=(python-tree-sitter)
makedepends=(uv python-installer)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6f90bc70a0f7b0a661c50805e97742a784002cb17ab8a3b3896fb486d54f591e')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
