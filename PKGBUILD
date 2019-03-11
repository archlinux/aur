# Maintainer: Philipp A. <flying-sheep@web.de>

_name=future-fstrings
pkgname=python-$_name
pkgver=1.0.0
pkgrel=2
pkgdesc='A backport of fstrings to python<3.6'
arch=(any)
url="https://github.com/asottile/$_name"
license=(MIT)
depends=(python)
makedepends=(install-wheel-scripts)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('928aac9e1879a9fc49b8d873cae4638ce5a70673a79199a9e3b97c821a61de11')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
