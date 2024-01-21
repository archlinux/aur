# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Major <majorx234@googlemail.com>
pkgname=python-inputs
_name=${pkgname#python-}
pkgver=0.5
pkgrel=4
pkgdesc="Cross-platform Python support for keyboards, mice and gamepads"
arch=('any')
url="https://github.com/zeth/inputs"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_name}-$pkgver.tar.gz::https://github.com/zeth/inputs/archive/refs/tags/v$pkgver.tar.gz"
        '3203c9e25f1e14c4316d85d59c536b4e407f569f.patch')
sha256sums=('d8e8a4b54747e102c4ab27f9eff0e6d64207690d7dbc75d2f6c6364881066fee'
            '92c69faff3038a42eb0fc4dfefe2657dea1e5cf0cea05c14d02ba04decdcc139')

prepare() {
  cd "${_name}-$pkgver"

  # https://github.com/zeth/inputs/issues/72
  # https://github.com/zeth/inputs/pull/90
  patch -Np1 -i ../3203c9e25f1e14c4316d85d59c536b4e407f569f.patch
}

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
