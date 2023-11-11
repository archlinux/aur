pkgname=libfirefly-git
pkgver=ec7ae69
pkgrel=1
pkgdesc='A standalone C++ Library for vectors calculations'
arch=(x86_64)
url='https://libfirefly.tbhaxor.com'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'make' 'git')
source=('git+https://github.com/tbhaxor/firefly.git')
sha256sums=('SKIP')
conflicts=('libfirefly2')

pkgver() {
  cd firefly || exit 1
  git log -n 1 --pretty=format:"%h"
}

prepare() {
  cmake -Bbuild -Sfirefly -DFirefly_ENABLE_DOUBLE_PRECISION=ON
}

build() {
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
