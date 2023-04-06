# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=Freed-Wu/help2man
_source_type=pypi-releases
_upstreamver='0.0.5'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="Convert --help and --version to man page."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
depends=(python-jinja)
conflicts=("$_pkgname")
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('b333c05ca074878190f88720d0bb9cf9501cb52990a8a5a57c3b95fc55682f6e')

package() {
	cd "$srcdir" || return 1
	python -m installer -d "$pkgdir" ./*.whl
}
