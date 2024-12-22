# Maintainer: Kherim Willems <aur@kher.im>

pkgname=python-types-pyserial
_pkgname=types_pyserial
_hashblake='9e66810259f5b3c7ed9d8efb862bb5fc5957971d13d9c6a90f80405a3f3ada62'
pkgver=3.5.0.20241221
pkgrel=1
pkgdesc="Typing stubs for pyserial"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-typing_extensions')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/${_hashblake:0:2}/${_hashblake:2:2}/${_hashblake:4}/${_pkgname}-${pkgver}.tar.gz"
        "grep-return-type.patch")
sha256sums=('712496c57350fa138287948965721e3b955914de4b10ef1ec4b3765895b6dc39'
            '0d694e57f0d2665cdd8b4ced1b231e4268470ede79ec1d454c6b7cf90cddf916')

prepare() {
  patch --directory="${srcdir}/${_pkgname}-${pkgver}" --forward --strip=1 --input=../grep-return-type.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
