# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-ale-py
pkgver=0.8.1
pkgrel=2
pkgdesc="The Arcade Learning Environment (ALE) - a platform for AI research."
arch=('x86_64')
url="https://github.com/mgbellemare/Arcade-Learning-Environment"
license=('MIT')
makedepends=("cmake" "vcpkg" "python-pytest" "pybind11")
depends=("python" "python-numpy" "python-typing_extensions" "python-importlib_resources" "python-importlib-metadata" "python-gym")
_name="Arcade-Learning-Environment"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mgbellemare/$_name/archive/v$pkgver.tar.gz"
    "8e2dfff9425387bfb670a1ed7d5214ea2f89f4c9.patch")
sha256sums=('28960616cd89c18925ced7bbdeec01ab0b2ebd2d8ce5b7c88930e97381b4c3b5'
            'd9b7ffac15cb6f28f42709a33351da3d4d25dfb6ef85c4366e38391e56aad779')

prepare(){
    cd $_name-$pkgver
    patch --forward --strip=1 --input="${srcdir}/8e2dfff9425387bfb670a1ed7d5214ea2f89f4c9.patch"
}

build() {
    python -m pip wheel ./$_name-$pkgver --no-build-isolation
}

_check() {
    cd $_name-$pkgver
    python -m pytest
}

package() {
    python -m installer --destdir="$pkgdir" ale_py-${pkgver}+*.whl
}

