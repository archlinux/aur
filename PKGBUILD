# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=dsinternals
pkgname="python-$_name"
pkgver=1.2.5
pkgrel=1
pkgdesc="Python library containing necessary components to interact with Active Directory."
arch=(any)
url="https://github.com/p0dalirius/py$_name"
license=('MIT')
depends=(
  'python>=3.4'
  'python-pyopenssl'
  'python-pycryptodomex'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('846171fdea67e10d440821ac63099b8ee34d1962117db89cf5a2f8d61df72515641100510c96906559daab06b3ebeeeb72d09808c0b065a6e4aceaae5fd5ebd1')

build() {
  cd "py$_name-$pkgver"
  python -m build -wnx
}

check() {
  cd "py$_name-$pkgver"
  python -m unittest
}

package() {
  cd "py$_name-$pkgver"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
