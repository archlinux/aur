# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=spdlog-git
pkgver=0.14.0.r1259.9688689
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('any')
url='https://github.com/gabime/spdlog/'
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('spdlog')
provides=('spdlog')
source=('git://github.com/gabime/spdlog.git')
sha512sums=('SKIP')

pkgver() {
  cd spdlog
  echo "$(grep 'project(' CMakeLists.txt | cut -d ' ' -f3 | cut -d ')' -f1).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../spdlog \
    -DSPDLOG_BUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 spdlog/LICENSE ${pkgdir}/usr/share/licenses/spdlog/LICENSE
}
