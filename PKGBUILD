# Maintainer: Michael Yang <ohmyarchlinux@pm.me>

pkgname=vcpkg-git
pkgver=r6122.15f455e3
pkgrel=1
pkgdesc='VC++ Packaging Tool'
arch=('x86_64')
url='https://github.com/Microsoft/vcpkg'
license=('MIT')
makedepends=('git' 'cmake>=3.3.0')
conflicts=('vcpkg')
provides=('vcpkg')
source=('git+https://github.com/Microsoft/vcpkg.git')
sha512sums=('SKIP')

pkgver() {
  cd vcpkg
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../vcpkg/toolsrc \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  install -Dm755 build/vcpkg ${pkgdir}/usr/bin/vcpkg
  install -Dm644 vcpkg/LICENSE.txt ${pkgdir}/usr/share/licenses/vcpkg-git/LICENSE.txt
}
