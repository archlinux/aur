# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_name=python-taint
pkgname=pyt
pkgver=0.1
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python-gitpython' 'python-graphviz' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('a6e92ca5fcc1f66d49b987df9516654c1e3932e2e57805342efb25e2d3bc2ad65a56ecbfb7ab40b32b67fc2ccfc9f4496347cbbda5732c7853ce7ee09e0a0099')

prepare() {
  cd pyt-$pkgver
  sed -i 's/==/>=/g' setup.py
}

build() {
  cd pyt-$pkgver
  python setup.py build
}

check() {
  cd pyt-$pkgver
  python -m tests
}

package() {
  cd pyt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
