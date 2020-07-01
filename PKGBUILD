# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-metadata
pkgname=python-pytest-metadata
pkgver=1.10.0
pkgrel=1
pkgdesc="Plugin for accessing test session metadata"
arch=('any')
url="https://github.com/pytest-dev/pytest-metadata"
license=('MPL2')
depends=('python-pytest')
makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('e421d12f9cfb160fcc4dd959187b7c5b12f7b7ff8747313933afda1c4c7bfeedbf609ced551f90c05142745dd95e767a51d8440c789f57e6e3062741a77f5adc')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
