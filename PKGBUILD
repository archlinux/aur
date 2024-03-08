# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-zcbor
_name=${pkgname#python-}
pkgver=0.8.1
pkgrel=1
pkgdesc="zcbor is a low footprint CBOR library in the C language (C++ compatible), tailored for use in microcontrollers."
arch=('any')
url="https://github.com/NordicSemiconductor/zcbor"
license=('Apache 2.0')
depends=('python' 'python-cbor2' 'python-yaml' 'python-regex')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
optdepends=('python-pyelftools' 'python-pyserial' 'python-serial')

source=("${_name}-$pkgver.tar.gz::https://github.com/NordicSemiconductor/zcbor/releases/download/$pkgver/${_name}-$pkgver.tar.gz")
sha256sums=('53763faf7b418732ba6c69ccc5da8acd2edb2c7c80ce0a466793d52bda70ecf9')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
