# Maintainer: Kherim Willems <aur@kher.im>
# Co-maintainer: Tércio Martins

pkgname=python-types-pyserial
_pkgname=types_pyserial
_hashblake='a2b20d74759b5b40827b38f144be6e188fe117d592c218c98347d7aa4966193c'
pkgver=3.5.0.20260519
pkgrel=1
pkgdesc="Typing stubs for pyserial"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-typing_extensions')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/${_hashblake:0:2}/${_hashblake:2:2}/${_hashblake:4}/${_pkgname}-${pkgver}.tar.gz"
        "grep-return-type.patch")
sha256sums=('0d6452781871f9af7b8598e24faa5f75d4ad50848a6fb301b4ae30b0e6ec3765'
            '1101e12d68179e99636f5dcb2f73c99dc1d2c7b466365d0e6f2f08edc181e66e')

prepare() {
  patch --verbose --directory="${srcdir}/${_pkgname}-${pkgver}" --forward --strip=1 --input=../grep-return-type.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
