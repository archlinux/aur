# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dom-toml
pkgver=0.6.1
pkgrel=1
pkgdesc="Dom's tools for Tom's Obvious, Minimal Language"
arch=('any')
url='https://dom_toml.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-domdf-python-tools'
  'python-toml'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-flit-core'
)
#checkdepends=('')
#optdepends=('')
_commit='3f5a0d19225f29e8b5c3b982d61611693553ac89'
source=("$pkgname::git+https://github.com/domdfcoding/dom_toml#commit=$_commit")
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
