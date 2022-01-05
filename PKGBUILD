# Maintainer: Phil A. <flying-sheep@web.de>
_name=ipycytoscape
pkgname=jupyterlab-extension-$_name
pkgver=1.3.1
pkgrel=1
pkgdesc='Python implementation of the graph visualization tool Cytoscape.'
arch=(any)
url=https://pypi.org/project/$_name
license=(BSD)
depends=(jupyterlab python-ipywidgets python-spectate)
provides=(python-ipycytoscape jupyter-cytoscape jupyterlab-extension-cytoscape)
_wheel="${_name/-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('2b02ed284b5da3e0d93b3a2c5810b3c2f5a66b54a57e7b04c6206cce6706fda3')

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
