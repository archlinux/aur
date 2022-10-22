# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=jupyter-ibm-quantum-widgets
_name=${pkgname#jupyter-}
pkgver=1.0.3
pkgrel=1
pkgdesc="IBM Quantum widgets for Jupyter"
arch=('any')
url="https://pypi.org/project/ibm-quantum-widgets"
license=('custom:IBM')
depends=(
    'python-ipykernel'
    'python-ipywidgets'
    'python-traitlets'
)
makedepends=(
    'python-installer'
)
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
b2sums=('201df4fcb7e17a8e82142acc985badaa2a7d0c4569464c3313f4525f68dd94cf9651bf117ff6b03bc68aeb88edf264a97f7708d0f10464b06d706613c4d65839')

package() {
    cd "${srcdir}"
    python -m installer --destdir="$pkgdir" *.whl
    install -D -m644 ${_name//-/_}-${pkgver}.dist-info/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
