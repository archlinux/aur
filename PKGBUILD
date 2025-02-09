# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=mesa
pkgname=python-${_name,,}
pkgver=3.1.4
pkgrel=1
pkgdesc="Agent-based modeling (ABM) in Python"
arch=('any')
url="https://github.com/projectmesa/mesa"
license=(Apache)
depends=('python>=3.11'
	python-numpy
	python-pandas
	python-scipy
	python-tqdm)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=(c5e3d353846225a5d6bd180e0db984ce3d3ae8e5a98808dbd4afee59914f2eec)

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    rm -rf "$pkgdir/usr/lib/python$_python_version/site-packages/tests"
}
