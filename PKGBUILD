pkgname=libfirefly-git
pkgver=2.1.0.26.gbc45985
pkgrel=1
pkgdesc='A standalone C++ Library for vectors calculations'
arch=(x86_64)
url='https://libfirefly.tbhaxor.com'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'make' 'git')
source=('git+https://github.com/tbhaxor/firefly.git')
sha256sums=('SKIP')

pkgver() {
  cd firefly || exit 1
	git describe --tags --long | sed 's/^v//;s/-/./g'
}

prepare() {
  cmake -Bbuild -Sfirefly -DFirefly_ENABLE_DOUBLE_PRECISION=ON
}

build() {
  cmake --build build -j "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir"/firefly/LICENSE "$pkgdir"/usr/share/licences/libfirefly/LICENCE
}
