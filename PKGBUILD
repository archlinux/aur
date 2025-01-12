# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=mesa
pkgname=python-${_name,,}
pkgver=3.1.3
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
sha256sums=(29312f5e2c136022f10b51068ee4f7d3e09917d7f8e3f89d9870c0c831b07c9f)

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    rm -rf "$pkgdir/usr/lib/python$_python_version/site-packages/tests"
}
