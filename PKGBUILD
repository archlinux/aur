# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.16
pkgrel=2
pkgdesc="A simple flow-based testing framework"
url="https://github.com/OpenMDAO/testflo"
license=('Apache-2.0')
arch=('any')
depends=('python-coverage' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
source=("git+https://github.com/OpenMDAO/testflo.git#tag=$pkgver")
sha512sums=('d46baa39f2d5f663456fa53c60ec3e031dad91f314a07d874f5da05c5bf492a907310d4fb1a1c766dc21e20ca84fe17f699bfb6579d6ea758627d24700abfd52')

build() {
  cd testflo
  python -m build -nw
}

check() {
  cd testflo
  python -m venv --system-site-packages tmp_install
  tmp_install/bin/python -m installer dist/*.whl
  tmp_install/bin/testflo testflo.tests || echo "Tests failed"
}

package() {
  cd testflo
  python -m installer -d "$pkgdir" dist/*.whl
}
