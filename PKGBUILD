# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_name=atom
pkgname=python-atom
pkgver=0.6.0
pkgrel=5
pkgdesc='Memory efficient Python objects'
arch=(x86_64)
url='https://github.com/nucleic/atom'
license=('BSD' 'custom')
depends=(python)
makedepends=(python-setuptools python-cppy)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/nucleic/atom/archive/$pkgver.tar.gz)
sha512sums=('ff02baa80c1cfaf113a0dc153f825dc76cc01084aea0f34c6bb2f3e6926290d105ee433ab0abb2ad27a87fb5e76303fc2b4456c25fde3bab666234c4d3bbb4be')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

check() {
  cd ${_name}-${pkgver}
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
