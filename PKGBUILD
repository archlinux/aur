# Maintainer: Phil A. <flying-sheep@web.de>
# Contributor: Anthony Wang <ta180m@gmail.com>
_name=jupyterlab-git
pkgname=jupyterlab-extension-jupyterlab_git
pkgver=0.51.2
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
sha256sums=('1150edabd844f9a5a3c7ba676409b18b8cc95b1a7bb171f357318f4075db2263')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"
	mv "$site/${_name/-/_}-$pkgver.data/data/share" "$pkgdir/usr/"
	mv "$site/${_name/-/_}-$pkgver.data/data/etc" "$pkgdir/"
	rmdir "$site/${_name/-/_}-$pkgver.data"{/data,}
}
