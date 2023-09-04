# Maintainer: greyltc

pkgname=python-pyc_wheel
pkgver=1.2.7
pkgrel=1
pkgdesc="Compile all py files in a wheel to pyc files."
url="https://github.com/karpierz/pyc_wheel"
arch=(any)
license=('BSD')
depends=('python>=3.7')
makedepends=(
'python-setuptools>=42.0'
python-build
python-installer
python-wheel
python-pkg-about
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/karpierz/pyc_wheel/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e2b31e01a82bb6b10af584a79554db17c78b72dce6b393057b81bc6f561f030b')

build() {
  cd "pyc_wheel-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pyc_wheel-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
