# Maintainer: Florian Weßel <florianwessel@gmx.net>

pkgname=kdbindings
pkgver=1.1.0
pkgrel=1
pkgdesc='Reactive programming & data binding library in C++'
arch=('any')
url='https://github.com/KDAB/KDBindings'
license=('MIT')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/KDAB/KDBindings/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6316f2a8009e47d513fc85d7fa7ad135daf1495ce392aa7852601ae62a09dede022cfa05d9d990041e1abab08b577c86a5ac548128a550c0e1a4bb0a295818e9')
b2sums=('85778a9aa258d60acba78674f5a433787193f61dfc32fdb01a5d40ea67e6afdbfc861edf609b214885cab648f3cf80f739ee1c4c446b31ff190eb926a237ff46')

build() {
  cd "KDBindings-$pkgver"

  # build
  mkdir -p ../build

  cmake -B ../build -S . \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  make -C ../build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "KDBindings-$pkgver/LICENSES/MIT.txt"
}
