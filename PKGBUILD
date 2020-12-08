# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=auditwheel
pkgver=3.3.0
pkgrel=1
pkgdesc='Cross-distribution Linux wheels'
arch=(any)
url="https://github.com/pypa/$pkgname"
license=(MIT)
depends=(python-wheel python-pyelftools)
makedepends=(install-wheel-scripts)
_pyarch=py3
_wheel="$pkgname-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('a462fb349b33f716c954186ea67c085a84f83dcb8421f564166224612634dbf8')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
