# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=neurokit2
pkgname=python-${_name,,}
pkgver=0.2.12
pkgrel=1
pkgdesc="The Python Toolbox for Neurophysiological Signal Processing."
arch=('any')
url="https://github.com/scientisst/BioSPPy"
license=('MIT')
depends=('python>=3.9'
	 'python-numpy'
	 'python-scipy'
	 'python-pandas'
	 'python-matplotlib'
	 'python-scikit-learn>=1.0.0'
)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=(caad0a381fd68118fce380fa72a212011da091c73626b663cb21d9aff234cac5)

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    _license_path="${pkgdir}/usr/lib/python${_python_version}/site-packages/${_name}-${pkgver}.dist-info/LICENSE"
    install -Dm644 "${_license_path}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "${pkgdir}/usr/lib/python${_python_version}/site-packages/tests"
}
