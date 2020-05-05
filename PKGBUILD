# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-metadata
pkgname=python-pytest-metadata
pkgver=1.9.0
pkgrel=1
pkgdesc="Plugin for accessing test session metadata"
arch=('any')
url="https://github.com/pytest-dev/pytest-metadata"
license=('MPL2')
depends=('python-pytest')
makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('d36a40870d3d991d6726e46a984c9bafc6f131d0b2149a7426a6418b16a18807d32afe77458d7b6b5c332677cef288e29e161ad9ffc3a14d26553a066d6a6694')

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
