# Maintainer: Michael Yang <ohmyarchlinux@pm.me>

pkgname=spdlog-git
pkgver=0.16.3.r116.g64c2fe1
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('any')
url='https://github.com/gabime/spdlog'
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('spdlog')
provides=('spdlog')
source=('git+https://github.com/gabime/spdlog.git')
sha512sums=('SKIP')

pkgver() {
  cd spdlog
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../spdlog \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

check() {
  cd build
  make test
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 spdlog/LICENSE ${pkgdir}/usr/share/licenses/spdlog/LICENSE
}
