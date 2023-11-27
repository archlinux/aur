# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=Mesa
pkgname=python-${_name,,}
pkgver=2.1.5
pkgrel=1
pkgdesc="Agent-based modeling (ABM) in Python 3+"
arch=('any')
url="https://github.com/projectmesa/mesa"
license=(Apache)
depends=('python>=3.8'
	python-click
	python-cookiecutter
	python-matplotlib
	python-mesa-viz-tornado
	python-networkx
	python-numpy
	python-pandas
	python-solara
	python-tqdm)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=('8c457f75af6021597eae0a041563153b286d1b6e4a99071da0f58b10c7c4c58c')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    rm -rf "$pkgdir/usr/lib/python$_python_version/site-packages/tests"
}
