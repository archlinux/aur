# Maintainer: Eritque Arcus <eritque-arcus at eritque-arcus dot tech>

_name="pyhidra"
pkgname="python-$_name"
pkgver=1.0.2
pkgrel=1
pkgdesc='Pyhidra is a Python library that provides direct access to the Ghidra API within a native CPython interpreter using jpype.'
arch=(any)
url="https://github.com/dod-cyber-crime-center/$_name"
license=(LicenseRef-DC3-Pyhidra-Open-Source-License)
depends=(python python-jpype1 'java-environment>=17')
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('8d72973189ae6b58cc9a9ff1950d632f5dd237e3fdd81c090c7e13582181ce0e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
