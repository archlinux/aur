# Maintainer: Philipp A. <flying-sheep@web.de>

_name=wheel-inspect
pkgname=python-$_name
pkgver=1.7.0
pkgrel=1
pkgdesc='Extract information from wheels'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python python-attrs python-entry-points-txt python-headerparser python-packaging python-readme-renderer python-wheel-filename)
makedepends=(install-wheel-scripts)
_pyarch=py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('69b34de1f4464ddfc76280c4563e4afc644de2c88e3ae6882f030afdad3d73e4')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
