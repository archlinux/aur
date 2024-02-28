# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=sktime
pkgname=python-${_name,,}
pkgver=0.27.0
pkgrel=1
pkgdesc='A unified framework for machine learning with time series'
arch=('any')
url="https://github.com/sktime/sktime"
license=('BSD-3-Clause')
depends=('python>=3.8'
	 'python-numpy>=1.21'
	 'python-scipy>=1.2'
	 'python-scikit-learn>=0.24'
	 'python-scikit-base')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('98b6167a97a17c20fa9f21003aa25fb93db0cdc44a767abe7fb43f3e0552fa75')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    rm -rf "$pkgdir"/usr/lib/python${_python_version}/site-packages/{tests,docs,build_tools,examples,extension_templates}
}
