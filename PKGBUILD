# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=sktime
pkgname=python-${_name,,}
pkgver=0.37.0
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
sha256sums=(c06b219e63cf1925166ab3bf765f48de67d6eec97a4ee5ba32412f13297dbd9c)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    rm -rf "$pkgdir"/usr/lib/python${_python_version}/site-packages/{tests,docs,build_tools,examples,extension_templates}
}
