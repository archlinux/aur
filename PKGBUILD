# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-metadata
pkgname=python-pytest-metadata
pkgver=1.8.0
pkgrel=3
pkgdesc="Plugin for accessing test session metadata"
arch=('any')
url="https://github.com/pytest-dev/pytest-metadata"
license=('MPL2')
depends=('python-pytest')
makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('04871fe0c4c30bc23eba80a58919841cf45045b91d501e67630426cbac88a16005657eaccb1d2587263d4fcd940d37382f3a5649f142b1aab327f1f1c5d61963')

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
