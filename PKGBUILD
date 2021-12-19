# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata2ri
pkgname=python-$_name
pkgver=1.0.6
pkgrel=1
pkgdesc='Converter between Python’s AnnData and R’s SingleCellExperiment.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-anndata python-rpy2 python-tzlocal)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('371858384c3e87bd44438677a00e7c02df7e04a5c0fff9c6ce11076069bf2d07')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"

	#fix permissions, fixed in flit 3.0: https://github.com/takluyver/flit/pull/256
	find "$site" -type f -exec chmod 644 {} \;
}
