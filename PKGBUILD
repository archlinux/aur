# Maintainer: Kherim Willems <aur@kher.im>
# Co-maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=python-types-pyserial
_pkgname=types_pyserial
_hashblake='73543e46467007f7d5d9f37965c3aed5be4ee09bbb9b9233058c8e4ef4e0d953'
pkgver=3.5.0.20261030
pkgrel=1
pkgdesc="Typing stubs for pyserial"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-typing_extensions')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/${_hashblake:0:2}/${_hashblake:2:2}/${_hashblake:4}/${_pkgname}-${pkgver}.tar.gz"
        "grep-return-type.patch")
sha256sums=('121ba5a8020063f1e0722417502f7f35b6b589b343045284eba94cc7cf43435f'
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
