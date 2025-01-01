# Maintainer: Florian Weßel <florianwessel@gmx.net>

pkgname=comms-dsl
pkgver=6.3.4
pkgrel=1
pkgdesc='DSL schemas parser and code generator for CommsChampion Ecosystem'
arch=('any')
url='https://github.com/commschamp/commsdsl'
license=('Apache-2.0')
makedepends=('cmake' 'ninja' 'libxml2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/commschamp/commsdsl/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f782f624016d8dd45280a647b056430eed246ee1d1ab6ff9c55870bb7ed7111d4d4d02d14c59aa3364625cdb804e4af1965b8b3834d5f4a2865d062a1ff2b75e')
b2sums=('674f681472cef8eae1dec85852d69caaff251548dd27192c8f4ce54cfcc4f21a2ff50cfdfaa6bf61c64c159acc530cd6444a5a5be653f31b9999746d419fc0b9')

build() {
  cd "commsdsl-$pkgver"

  # build
  mkdir -p ../build

  cmake -B ../build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMMSDSL_INSTALL_APPS=ON \
    -DCOMMSDSL_INSTALL_LIBRARY=ON \
    -DCOMMSDSL_INSTALL_LIBRARY_HEADERS=ON \
    -DCOMMSDSL_BUILD_UNIT_TESTS=OFF \
    -DCOMMSDSL_WARN_AS_ERR=OFF \
    -DCOMMSDSL_WIN_ALLOW_LIBXML_BUILD=OFF \
    -DBUILD_TESTING=OFF

  make -C ../build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "commsdsl-$pkgver/LICENSE.txt"
}
