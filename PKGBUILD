# Maintainer: Alexander Bocken <alexander@bocken.org>

_name=nolds
pkgname=python-${_name,,}
pkgver=0.5.2
pkgrel=1
pkgdesc='a package to calculate features from Rr Interval for HRV analyses'
arch=('any')
url="https://github.com/Aura-healthcare/hrv-analysis"
license=('MIT')
depends=('python'
	 'python-numpy'
	 'python-setuptools'
	 'python-future'
	 )
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=('3fc955d639437ab5a1b2e2fb45271c3b5613a191abe70bcab4b62093a2b89eec')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    rm -rf "$pkgdir"/usr/lib/python${_python_version}/site-packages/{tests,docs,build_tools,examples,extension_templates}
}
