# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=flit
pkgver=2.1.0
pkgrel=3
pkgdesc='Simple packaging tool for simple Python packages.'
arch=('any')
url="http://$pkgname.readthedocs.io"
license=('BSD')
depends=(python python-pytoml python-requests python-requests_download python-docutils)
makedepends=(install-wheel-scripts)
_wheel_cli="$pkgname-$pkgver-py3-none-any.whl"
_wheel_core="${pkgname}_core-$pkgver-py2.py3-none-any.whl"
source=(
	"https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel_cli"
	"https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname-core/$_wheel_core"
)
sha256sums=(
	'494e0806840fe896fe31ce2a413583115324f12177ecaf7427f157caa9b9c5b2'
	'c6dff661e9e290d51084cefc38b0971d692290e8a352d0b6cec6006be764b4d1'
)
noextract=("$_wheel_cli" "$wheel_core")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel_cli" -d "$site"
	unzip "$_wheel_core" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel_cli"
	chmod 644 "$site/"*.dist-info/*
}
