# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pyproject-parser
pkgver=0.8.0
pkgrel=1
pkgdesc='Parser for pyproject.toml'
arch=('any')
url='https://github.com/repo-helper/pyproject-parser'
license=('MIT')
depends=(
  'python'
  'python-apeye-core'
  'python-attrs'
  'python-dom-toml'
  'python-domdf-python-tools'
  'python-natsort'
  'python-packaging'
  'python-shippinglabel'
  'python-toml'
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
# cli optdepends: click, consolekit & sdjson
optdepends=(
  'python-readme-renderer: render markdown'
  'python-cmarkgfm: render markdown'
)
_commit='0e6b5d2a29e8c8bf180f7510debd8b1bf90a5b6f'
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
