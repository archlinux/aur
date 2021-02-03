# Maintainer: Phil A. <flying-sheep@web.de>
_name=notebook-uuid
pkgname=jupyterlab-extension-$_name
pkgver=0.4.0
pkgrel=1
pkgdesc='Automatically assigns each notebook opened in Jupyter Lab a persistent UUID'
arch=(any)
url=https://pypi.org/project/$_name
license=(BSD)
depends=(jupyterlab)
provides=(python-notebook-uuid)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('fd69fb4daa9cf339bc8e6cbc11bfcf8a071ca7db7c556c6af9fbc96997f9c138')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/"* "$pkgdir/usr/"
}
