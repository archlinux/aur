# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>

_name=click-threading
pkgname=python-click-threading
pkgver=0.5.0
pkgrel=4
pkgdesc="Multithreaded Click apps made easy"
arch=("any")
url="https://pypi.python.org/pypi/click-threading"
license=("MIT")
depends=('python-click')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-click')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('0f3cfe6951488dfa9cb5b6a9356bef99cadc56556640e76f68deb7ca2748f578a8ad77fa063e3ca116b17546199a1b3c7982c58a5a6a7b028704692ce1f9e93f')
b2sums=('a3aa978ad2691c7f4c65e548865d102a6fcaacdd18c966e9695c7c7ff1e8d7dc292860d572879cbbd5b4bd04e65e8b86f02539b2e578505a38216089742d7819')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  export PYTHONPATH=build/lib:${PYTHONPATH}
  pytest -v
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
