# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-shippinglabel
pkgver=1.4.1
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
  'python-typing-extensions'
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
_commit='c61c0a2060f13ce7e51d3c68b5a3f322bc4efbfd'
source=("$pkgname::git+https://github.com/domdfcoding/shippinglabel#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
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
