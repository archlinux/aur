# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-shippinglabel
pkgver=2.1.0
pkgrel=1
pkgdesc='Utilities for handling Python packages'
arch=('any')
url='https://shippinglabel.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-apeye'
  'python-dist-meta'
  'python-dom-toml'
  'python-domdf-python-tools'
  'python-packaging'
  'python-platformdirs'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
#checkdepends=('')
#optdepends=('')
source=("$pkgname::git+https://github.com/domdfcoding/shippinglabel#tag=v$pkgver")
sha512sums=('4b2a14a98b6ff90e0381ca6e7a5589b889308f70142d731cb119ae6a524364dd1c946732c7f51ac896c3888b16b6edaa6bb0c8f3172e2ea301bd75cf6684c312')
b2sums=('f309f4b3a2bb9f3a41bbbd91b6410fbf4a6993666396b54bac579e6179299c0e2b50920eb39cd85018846b9b2e1a5f9ac0612b3c1325ffc7a3d3a540d82fc151')

prepare() {
  cd "$pkgname"

  # remove version constraints
  sed \
    -e 's/^requires = \[.*/requires = \[ "setuptools", "wheel" \]/' \
    -i pyproject.toml
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
