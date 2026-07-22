# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/termux/termux-language-server/blob/main/.github/workflows/main.yml
pkgname=termux-language-server
_name=$pkgname
pkgver=0.1.6
pkgrel=1
pkgdesc="Language server for build.sh, PKGBUILD, ebuild"
arch=(any)
url=https://github.com/termux/termux-language-server
provides=(pkgbuild-language-server portage-language-server)
conflicts=(pkgbuild-language-server portage-language-server)
replaces=(pkgbuild-language-server portage-language-server)
depends=(python-tree-sitter-bash python-platformdirs python-lsp-tree-sitter python-jinja python-fqdn python-rfc3987 namcap pyalpm)
optdepends=(portage)
makedepends=(uv python-installer)
license=(GPL3)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6cafcc9d1b7e89ad6386b5157027e19264f91f5d4e002d79550bf0ab6f7444bb')

build() {
	cd "${_name//-/_}-$pkgver" || exit
	uv build --wheel --no-build-isolation
}

package() {
	cd "${_name//-/_}-$pkgver" || exit
	python -m installer --destdir="$pkgdir" dist/*.whl
}
