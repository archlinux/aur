# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/repl-python-codestats
_source_type=pypi-releases
_upstreamver='0.0.3'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc=""
arch=(any)
url=https://github.com/$_repo
depends=(python-repl-python-wakatime)
makedepends=(python-installer)
optdepends=(
	'keyring: use keyring to restore API key'
	'ptpython: support ptpython'
	'ipython: support ipython'
)
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('b6fa1f0b76a9a9ba39e59b8d222e54da5c174c5d8ee6818b2f82bc21fa7c4ee9')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
