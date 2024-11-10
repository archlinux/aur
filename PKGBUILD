# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-zcbor
_name=${pkgname#python-}
pkgver=0.9.1
pkgrel=1
pkgdesc="zcbor is a low footprint CBOR library in the C language (C++ compatible), tailored for use in microcontrollers."
arch=('any')
url="https://github.com/NordicSemiconductor/zcbor"
license=('Apache 2.0')
depends=('python' 'python-cbor2' 'python-yaml' 'python-regex')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
optdepends=('python-pyelftools' 'python-pyserial')

source=("${_name}-$pkgver.tar.gz::https://github.com/NordicSemiconductor/zcbor/releases/download/$pkgver/${_name}-$pkgver.tar.gz")
sha256sums=('c04918392e2dbb14c6f038d776e2ea6b09c34ba1028b045aadd7c3a95616bc38')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
