# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=wakatime/repl-python-wakatime
_source_type=pypi-releases
_upstreamver='0.0.6'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Python REPL plugin for automatic time tracking and metrics generated from your programming activity"
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
optdepends=(
	'wakatime: support wakatime'
	'ptpython: support ptpython'
	'ipython: support ipython'
)
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('3583e66feb0fb80e9410de20e851cc5b65d789868674606aa3c41941b0c09aaf')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
