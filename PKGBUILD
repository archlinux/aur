# Maintainer: Philipp A. <flying-sheep@web.de>

_name=wheel-inspect
pkgname=python-$_name
pkgver=1.1.0
pkgrel=2
pkgdesc='Extract information from wheels'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python python-attrs python-headerparser python-packaging python-property-manager python-readme-renderer python-setuptools)
makedepends=(install-wheel-scripts)
_pyarch=py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('be942dbba09f7a0472942af0571cd57cc034fc19744543685a5210fbd34718ff')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
