# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litepcie
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=6
pkgdesc='Small footprint and configurable PCIe core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD-2-Clause')
depends=('python-migen' 'python-litex' 'python-yaml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-litex-boards')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dbfecb9a3c47cb0ad3711bb7881557b8b1d598bfff87835ca6d7fda15b2a991797a675690da11b1fe46f3cf2a98ca3f2be35193e63b9e596bb1d697dde70a941')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
