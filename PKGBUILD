# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=pyDes
pkgname=python-pydes
pkgver=2.0.1
pkgrel=5
pkgdesc="Pure python implementation of DES and TRIPLE DES encryption algorithm"
arch=('x86_64')
url="https://pypi.org/project/pyDes/"
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
b2sums=('45a2d0575519afc389abe080f2c3a6751c5ee1f973e9e4370f24c5dbf9d85882e875682005eae3d749a2e11bffc3cd46868f83baa58f9e7e4feb7a25db641a14')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
