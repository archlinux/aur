# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=nlohmann_json-git
pkgver=2.0.7.r1170.ed61111
pkgrel=1
pkgdesc="JSON for Modern C++"
arch=('i686' 'x86_64')
url="https://nlohmann.github.io/json/"
license=('MIT')
makedepends=('git' 'cmake>=3.0')
conflicts=('nlohmann_json')
provides=('nlohmann_json')
source=("git://github.com/nlohmann/json.git#branch=develop")
sha512sums=('SKIP')

pkgver() {
  cd json
  echo "2.0.7.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../json \
    -DBuildTests=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 json/LICENSE.MIT ${pkgdir}/usr/share/licenses/nlohmann_json/LICENSE
}
