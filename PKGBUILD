# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/termux/termux-language-server/blob/main/.github/workflows/main.yml
pkgname=termux-language-server
_name=$pkgname
pkgver=0.1.13
pkgrel=1
pkgdesc="Language server for build.sh, PKGBUILD, ebuild"
arch=(any)
url=https://github.com/termux/termux-language-server
provides=(pkgbuild-language-server portage-language-server)
conflicts=(pkgbuild-language-server portage-language-server)
replaces=(pkgbuild-language-server portage-language-server)
depends=(python-tree-sitter-bash python-platformdirs python-lsp-tree-sitter python-jinja python-fqdn python-rfc3987 namcap pyalpm python-marisa-trie)
optdepends=(portage paru)
makedepends=(uv python-installer)
license=(GPL3)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('dd068169af66cf1aa877a40109e388191ea48ee1b1cbf9fabe81be012ea5413c')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
