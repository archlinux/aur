# Maintainer: Phil A. <flying-sheep@web.de>
# Contributor: Anthony Wang <ta180m@gmail.com>
_name=jupyterlab-git
pkgname=jupyterlab-extension-jupyterlab_git
pkgver=0.51.4
pkgrel=1
pkgdesc='Git extension for JupyterLab'
arch=(any)
url=https://github.com/jupyterlab/$_name
license=(BSD)
depends=(jupyterlab jupyter-server python-nbdime jupyter-nbformat python-packaging python-pexpect python-traitlets)
makedepends=(unzip)
provides=(jupyterlab-extension-git python-jupyterlab-git)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_wheel")
sha256sums=('b49ce4a69ec22a9a265c447ff08442ee0efc533d9f109eb76b5d735f33f4e510')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/share" "$pkgdir/usr/"
	mv "$site/${_name/-/_}-$pkgver.data/data/etc" "$pkgdir/"
	rmdir "$site/${_name/-/_}-$pkgver.data"{/data,}
}
