# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pip-api
pkgver=0.0.30
pkgrel=1
pkgdesc="An unofficial, importable pip API"
url="https://github.com/di/pip-api"
license=('Apache')
arch=('any')
depends=('python-packaging' 'python-pyparsing' 'python-pip')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pretend' 'python-virtualenv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/di/pip-api/archive/$pkgver.tar.gz")
sha512sums=('0fa69d55c919f2985c0acfdc719eff0a89ac065df8eca84d518a5ed0bcfb3a79c559002441041ef3382ca60a4d6c8bd991fd71316cd4e4d1643a3e084ed60f89')

prepare() {
  cd pip-api-$pkgver
  # Devendor
  sed -i 's/pip_api._vendor.//' pip_api/*.py tests/*.py

  rm -r pip_api/_vendor
}

build() {
  cd pip-api-$pkgver
  python setup.py build
}

check() {
  cd pip-api-$pkgver
  python setup.py pytest
}

package() {
  cd pip-api-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
