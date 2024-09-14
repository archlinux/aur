# Maintainer: Essem <smswessem@gmail.com>

pkgname=corrscope
pkgver=0.10.1
pkgrel=2
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
  'python-installer'
  'python-poetry-core'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/corrscope/corrscope/archive/refs/tags/$pkgver.tar.gz"
        "no-appnope.patch"
        "corrscope.png"
        "corrscope.desktop")
sha256sums=('07016441cb7de7f238fd38736bec184eaaa58aba2b0d76d4047d43d0bf82f3c7'
            '4d85a0c057545e1459b5362ab81a2c953b63c5efd9094d208c0dbef662203636'
            '41777f8b4593e9154931bcbdb86e43e5c5d7b476be714a42affca0aee88e2cf8'
            'bfb12bd87d93af48e0f80e2241493078ced904af339e17c0661fd7b8cd1ebdda')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < "$srcdir/no-appnope.patch"
}

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
