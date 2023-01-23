# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-whey
pkgver=0.0.23
pkgrel=1
pkgdesc='A simple Python wheel builder for simple projects'
arch=('any')
url='https://whey.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-consolekit'
  'python-dist-meta'
  'python-dom-toml'
  'python-domdf-python-tools'
  'python-handy-archives'
  'python-natsort'
  'python-packaging'
  'python-pyproject-parser'
  'python-shippinglabel'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  'python-docutils: readme functionality'
  'python-readme-renderer: readme functionality'
  'python-cmarkgfm: readme functionality'
  'python-editables: editable installs'
)
_commit='ceeaccf9e0524a6d66ba3bbe7c96d509dca0d640'
source=("$pkgname::git+https://github.com/repo-helper/whey#commit=$_commit")
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
