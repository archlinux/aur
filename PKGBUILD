# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=Mesa
pkgname=python-${_name,,}
pkgver=2.2.0
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
sha256sums=('3eadf6a5d55530c5482309b6f8262af35dc9be4f8d52de1e5a464e3a50047b91')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    rm -rf "$pkgdir/usr/lib/python$_python_version/site-packages/tests"
}
