# Maintainer: Phil A. <flying-sheep@web.de>
_name=ipycytoscape
pkgname=jupyterlab-extension-$_name
pkgver=1.3.0
pkgrel=1
pkgdesc='Python implementation of the graph visualization tool Cytoscape.'
arch=(any)
url=https://pypi.org/project/$_name
license=(BSD)
depends=(jupyterlab python-ipywidgets python-spectate)
provides=(python-ipycytoscape jupyter-cytoscape jupyterlab-extension-cytoscape)
_wheel="${_name/-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('b9b6f3ddef2512dc3455baf768618a8a8f5df692b2b6accf6efae56fb53f1b00')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	(
		cd "$site/${_name/-/_}-$pkgver.data"
		mv "data/etc/" "$pkgdir/"
		mv "data/share/" "$pkgdir/usr/"
		rmdir data
	)
}
