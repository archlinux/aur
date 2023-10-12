# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=Mesa
pkgname=python-${_name,,}
pkgver=2.1.2
pkgrel=1
pkgdesc="Agent-based modeling (ABM) in Python 3+"
arch=('any')
url="https://github.com/projectmesa/mesa"
license=(Apache)
depends=('python>=3.8' python-click python-cookiecutter python-networkx python-numpy python-pandas python-tornado python-tqdm)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_whl")
sha256sums=('56dbd6b8d3f5cf6824dc5b2368530d073af7544de03c08c15e7923fc85d32ee5')

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    rm -r "$pkgdir/usr/lib/python$_python_version/site-packages/tests"
}
