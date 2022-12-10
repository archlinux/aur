# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/sphinxcontrib-eval
_source_type=pypi-releases
_upstreamver='0.0.2'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Evaluate shell command or python code in sphinx and myst"
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
depends=(python-sphinx)
optdepends=('python-myst-parser: myst support')
conflicts=("$_pkgname")
license=(GPLv3)
_py=py3
_bin=trans
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('df65aa4dcfbb61fe03ef6effe0741018556846f6b683ae9085f2558fe63ebc03')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
