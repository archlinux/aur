# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-autodocsumm
pkgver=0.2.10
pkgrel=1
pkgdesc='Extending your autodoc API docs with a summary'
arch=('any')
url='https://github.com/Chilipp/autodocsumm'
license=('Apache')
depends=(
  'python'
  'python-sphinx'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-versioneer'
)
_commit='8ce14128954192f2b23850e9d23a4ac83b82af1e'
source=("$pkgname::git+$url#commit=$_commit")
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
}
