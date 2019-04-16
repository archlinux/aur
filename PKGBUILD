# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=scanpy-scripts
pkgver=0.1.0.1
pkgrel=1
pkgdesc='Scripts for using scanpy from the command line'
arch=(any)
provides=(scanpy python-scanpy)
url='https://github.com/ebi-gene-expression-group/scanpy-scripts'
license=(MIT)
depends=(scanpy python-louvain-igraph)
makedepends=(install-wheel-scripts)
_pyarch=py3
_wheel="${pkgname/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('a46e5cc76f40b0ce281d982a75d3c0030e276bb1645b931e5fc3e5cbde5625e5')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
