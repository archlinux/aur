# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dict2css
pkgver=0.3.0
pkgrel=1
pkgdesc='A μ-library for constructing cascading style sheets from Python dictionaries'
arch=('any')
url='https://github.com/sphinx-toolbox/dict2css'
license=('MIT')
depends=(
  'python'
  'python-css-parser'
  'python-domdf-python-tools'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-whey'
)
_commit='fe95ef7433306258a58b6a91b1e777c6c3628a1c'
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

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
