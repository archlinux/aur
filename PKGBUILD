# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=mesa
pkgname=python-${_name,,}
pkgver=3.0.2
pkgrel=1
pkgdesc="Agent-based modeling (ABM) in Python"
arch=('any')
url="https://github.com/projectmesa/mesa"
license=(Apache)
depends=('python>=3.10'
	python-click
	python-cookiecutter
	python-matplotlib
	python-mesa-viz-tornado
	python-networkx
	python-seaborn
	python-numpy
	python-pandas
	python-solara
	python-tqdm)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=(b5e835de40f8c162a7baaf1ad634fa29b40aeb75da7354dd0daf0b44adcec231)

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    rm -rf "$pkgdir/usr/lib/python$_python_version/site-packages/tests"
}
