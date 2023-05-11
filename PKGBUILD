# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dist-meta
pkgver=0.8.0
pkgrel=1
pkgdesc='Parse and create Python distribution metadata'
arch=('any')
url='https://dist-meta.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-domdf-python-tools'
  'python-handy-archives'
  'python-packaging'
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
_commit='6036a6fd75717632207677615f16c27da20258e9'
source=("$pkgname::git+https://github.com/repo-helper/dist-meta#commit=$_commit")
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
