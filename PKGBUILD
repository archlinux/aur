# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/autotools-language-server/blob/main/.github/workflows/main.yml
pkgname=autotools-language-server
_name=$pkgname
pkgver=0.1.3
pkgrel=1
pkgdesc="autotools language server"
arch=(any)
url=https://github.com/Freed-Wu/autotools-language-server
depends=(python-lsp-tree-sitter python-tree-sitter-autoconf)
makedepends=(uv python-installer)
license=(GPL3)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('1adc7ba8627533c141533d2da974d615a2f58214527759424d1fdfb6f0953401')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
