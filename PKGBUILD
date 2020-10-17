# Maintainer: Philipp A. <flying-sheep@web.de>

_name=anndata2ri
pkgname=python-$_name
pkgver=1.0.4
pkgrel=1
pkgdesc='Converter between Python’s AnnData and R’s SingleCellExperiment.'
arch=(any)
url="https://github.com/theislab/$_name"
license=(GPL3)
depends=(python-anndata python-rpy2 python-tzlocal)
_wheel="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
sha256sums=('7b10501323ac29be1ee531100d12a3d4384e41551412c7e07e8e973a3ad24f8b')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site"
	unzip "$_wheel" -d "$site"

	#fix permissions, fixed in flit 3.0: https://github.com/takluyver/flit/pull/256
	find "$site" -type f -exec chmod 644 {} \;
}
