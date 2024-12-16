# Maintainer: Kherim Willems <aur@kher.im>

pkgname=python-types-pyserial
_pkgname=${pkgname#python-}
pkgver=3.5.0.20240826
pkgrel=1
pkgdesc="Typing stubs for pyserial"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-typing_extensions')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "grep-return-type.patch")
sha256sums=('c88c603734410ad714fba85eb10f145dc592ccf1542bb958f12a8481722f37db'
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
