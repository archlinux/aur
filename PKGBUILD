# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=ttfautohint-py
pkgname=python-$_pyname
pkgver=0.5.0
pkgrel=1
pkgdesc='Python wrapper for ttfautohint, a free auto-hinter for TrueType fonts'
url="https://github.com/fonttools/$_pyname"
arch=(x86_64)
license=(MIT)
depends=(python)
makedepends=(python-pip)
_py=py2.py3
_wheel="${_pyname/-/_}-$pkgver-$_py-none-manylinux_2_17_$CARCH.manylinux2014_$CARCH.whl"
source=("https://files.pythonhosted.org/packages/$_py/${_pyname::1}/$_pyname/$_wheel")
sha256sums=('f63b3944e279ceca056f77d1120c7bb6ef53a77b3bb8effb75f96be899900313')

package() {
	export PIP_CONFIG_FILE=/dev/null
	pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
	python -O -m compileall "$pkgdir"
}
