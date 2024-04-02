# Maintainer: Essem <smswessem@gmail.com>

pkgname=corrscope
pkgver=0.9.0
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
  'python-installer'
  'python-poetry-core'
  'python-setuptools'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/corrscope/corrscope/archive/refs/tags/$pkgver.tar.gz"
        "no-appnope.patch")
sha256sums=('f53d47eed04200df7f4ec16d463f2a3a9be0f3bb867149a77602ace82373a5c0'
            '4d85a0c057545e1459b5362ab81a2c953b63c5efd9094d208c0dbef662203636')

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
}
