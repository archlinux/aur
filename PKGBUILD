# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=nlohmann_json-git
pkgver=2.1.1.r1989.6151b056
pkgrel=1
pkgdesc='JSON for Modern C++'
arch=('i686' 'x86_64')
url='https://nlohmann.github.io/json/'
license=('MIT')
makedepends=('git' 'cmake>=3.0.0')
conflicts=('nlohmann_json')
provides=('nlohmann_json')
source=("git://github.com/nlohmann/json.git#branch=develop")
sha512sums=('SKIP')

pkgver() {
  cd json
  echo "$(grep project CMakeLists.txt | cut -d ' ' -f3).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../json \
    -DJSONBuildTests=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 json/LICENSE.MIT ${pkgdir}/usr/share/licenses/nlohmann_json-git/LICENSE
}
