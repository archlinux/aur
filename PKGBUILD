# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=libolivecore-git
pkgver=r12.953ee66
pkgrel=1
arch=('x86_64')
pkgdesc=" Common components shared between Olive libraries"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
makedepends=('cmake' 'ffmpeg' 'git' 'imath' 'ninja' 'opentimelineio')
provides=('libolivecore')
conflicts=('libolivecore')
source=('git+https://github.com/olive-editor/core.git')
sha512sums=('SKIP')

pkgver() {
  cd core
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd core
  cmake -GNinja \
        -Bbuild \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DOTIO_DEPS_INCLUDE_DIR=/usr/include/opentimelineio
  ninja -C build/
}

package() {
  cd core
  DESTDIR="$pkgdir" ninja -C build/ install
}
