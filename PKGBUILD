# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=biosppy
pkgname=python-${_name,,}
pkgver=2.2.3
pkgrel=1
pkgdesc="A toolbox for biosignal processing written in Python."
arch=('any')
url="https://github.com/scientisst/BioSPPy"
license=('BSD-3-Clause')
depends=('python>=3.5.2'
	 'python-bidict'
	 'python-h5py'
	 'python-matplotlib'
	 'python-numpy'
	 'python-scikit-learn'
	 'python-scipy'
	 'python-shortuuid'
	 'python-six'
	 'python-joblib'
	 'python-opencv'
)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=(0d4e9d6cc2d6f5c0682e8747383002660b8eb761440cf090bcf845fa60a28d5a)

noextract=("$_whl")
package() {
    _python_version="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    python -m installer --destdir="$pkgdir" "$_whl"
    _license_path="${pkgdir}/usr/lib/python${_python_version}/site-packages/${_name}-${pkgver}.dist-info/LICENSE"
    install -Dm644 "${_license_path}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
