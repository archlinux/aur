# Maintainer: Philipp A. <flying-sheep@web.de>

_name=modulegraph
pkgname=python-modulegraph
pkgver=0.19.2
pkgrel=1
pkgdesc='determines a dependency graph between Python modules primarily by bytecode analysis for import statements'
arch=('any')
url="https://github.com/ronaldoussoren/$_name"
license=(MIT)
depends=(python python-altgraph)
makedepends=(install-wheel-scripts)
_pyarch=py2.py3
_wheel="${_name/-/_}-$pkgver-$_pyarch-none-any.whl"
source=("https://files.pythonhosted.org/packages/$_pyarch/${_name::1}/$_name/$_wheel")
sha256sums=('7985a8b3d97307b26e1872949973239b273602a041a3e2caedf80bc640909991')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
}
