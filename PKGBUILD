# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=sktime
pkgname=python-${_name,,}
pkgver=0.40.1
pkgrel=1
pkgdesc='A unified framework for machine learning with time series'
arch=('any')
url="https://github.com/sktime/sktime"
license=('BSD-3-Clause')
depends=('python>=3.9'
	 'python-joblib>=1.2.0'
	 'python-numpy>=1.21'
	 'python-packaging'
	 'python-pandas>=1.1'
	 'python-scikit-base>=0.6.1'
	 'python-scikit-learn>=0.24'
	 'python-scipy>=1.2')
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=(130bb0c39ca4377e491c4dfa64c8ac67c3de2660dd406dd7690db6a8ac349c4e)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    rm -rf "$pkgdir"/usr/lib/python${_python_version}/site-packages/{tests,docs,build_tools,examples,extension_templates}
}
