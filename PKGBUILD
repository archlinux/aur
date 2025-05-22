# Maintainer: Essem <smswessem@gmail.com>

pkgname=corrscope
pkgver=0.11.0
pkgrel=1
pkgdesc="Python program to render wave files into oscilloscope views, featuring advanced correlation-based triggering algorithm"
arch=('any')
url="https://github.com/corrscope/corrscope"
license=('BSD-2-Clause')
depends=(
  'python-ruamel-yaml'
  'python-numpy'
  'python-click'
  'python-matplotlib'
  'python-attrs'
  'python-appdirs'
  'python-atomicwrites'
  'python-colorspacious'
  'python-qtpy'
  'python-pyqt6'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/corrscope/corrscope/archive/refs/tags/$pkgver.tar.gz"
        "corrscope.png"
        "corrscope.desktop")
sha256sums=('2fe3379bc7432ed2744fb6797d7901e175e9d073ffe83c71704200df77621003'
            '41777f8b4593e9154931bcbdb86e43e5c5d7b476be714a42affca0aee88e2cf8'
            'bfb12bd87d93af48e0f80e2241493078ced904af339e17c0661fd7b8cd1ebdda')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  mkdir -p "$pkgdir/usr/share/doc"
  cp -r docs "$pkgdir/usr/share/doc/corrscope"

  install -vDm644 "$srcdir/corrscope.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/corrscope.png"
  install -vDm644 "$srcdir/corrscope.desktop" "$pkgdir/usr/share/applications/corrscope.desktop"
}
