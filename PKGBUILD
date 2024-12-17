# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pyproject-parser
pkgver=0.11.1
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
# cli optdepends: click, consolekit & sdjson
optdepends=(
  'python-readme-renderer: render markdown'
  'python-cmarkgfm: render markdown'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('8e3b20143a8495fbf8a7b033402b5d32788b5861fe76c92345ad475c1fec5931676a20a38c3bcded638d5eaa203854f9408383b47b3583e21bba3cbd0fdd43e3')
b2sums=('f993c04b6107c652de7a01545ea29f18cdf72a9e1397e258abe832a5e5ce23cec5c170f92551fd7dd5505605bb5483913ca3047d4eac405954e6638d8d424e16')

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
