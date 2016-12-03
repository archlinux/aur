# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=spdlog-git
pkgver=1.0.0.r1082.68cc3e6
pkgrel=1
pkgdesc="Very fast, header only, C++ logging library"
arch=('any')
url="https://github.com/gabime/spdlog"
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('spdlog')
provides=('spdlog')
source=("git://github.com/gabime/spdlog.git")
sha512sums=('SKIP')

pkgver() {
  cd spdlog
  echo "1.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../spdlog \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 spdlog/LICENSE ${pkgdir}/usr/share/licenses/spdlog/LICENSE
}
