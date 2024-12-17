# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dom-toml
pkgver=2.0.0
pkgrel=1
pkgdesc="Dom's tools for Tom's Obvious, Minimal Language"
arch=('any')
url='https://dom-toml.readthedocs.io/en/latest/'
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
source=("$pkgname::git+https://github.com/domdfcoding/dom_toml#tag=v$pkgver")
sha512sums=('e965b51b9ca90a348e64923f873edb4fe584ae5c422f7449b3bfaec882cae529d4a5f55982c27bba589c1b69ab35aa922bab9391df512f9ad02d1f52210bf4c8')
b2sums=('1a8585126cec058506b1dab814e2453f1e26a08b89a89430d751277cd3604156335c17743d5f2c727fee84d2e31658020ce77d20c5d1696feec8752a0faaece2')

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
