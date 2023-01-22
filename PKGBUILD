# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-apeye
pkgver=1.3.0
pkgrel=1
pkgdesc='Handy tools for working with URLs and APIs'
arch=('any')
url='https://apeye.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-apeye-core'
  'python-domdf-python-tools'
  'python-platformdirs'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-flit-core'
)
#checkdepends=('')
optdepends=(
  'python-cachecontrol: rate limiting'
  'python-lockfile: rate limiting'
  'python-ruamel-yaml: yaml serializer'
  'python-pyaml: yaml serializer'
)
_commit='8a31e4b23df577610a1a9589b1d2a15e1cf86bda'
source=("$pkgname::git+https://github.com/domdfcoding/apeye#commit=$_commit")
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
