# Maintainer: Kherim Willems <aur@kher.im>

pkgname=python-types-pyserial
_pkgname=${pkgname#python-}
pkgver=3.5.0.20240311
pkgrel=1
pkgdesc="Typing stubs for pyserial"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-typing-extensions')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "grep-return-type.patch")
sha256sums=('be07e32ad3607314d4198aac427ac23b3f02e3d2f9522503299045abf1230d98'
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
