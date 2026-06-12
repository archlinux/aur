# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.41.1
pkgrel=2
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/friendlyanon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fa6ab1e39c2f20ccd5dc5e254d66059b9123a92c5af984bebc9950cec6715fad')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/package"
  sed -i 's|license_files=.*|license_files=("COPYING",),|' setup.py
  cp ../COPYING .
}

build() {
  cd "$pkgname-$pkgver/package"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver/package"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
