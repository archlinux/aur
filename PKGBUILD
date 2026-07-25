# Maintainer: Noel Knubel <skaredogged97@pm.me>
pkgname=pyrofling-git
pkgver=0.r310.dcd68d3  # This is a placeholder, pkgver() will overwrite this
pkgrel=1
pkgdesc="Simple solution for capturing and broadcasting Vulkan applications via FFmpeg, PyroEnc or PyroWave including latency measurement capabilities"
arch=('x86_64')
url="https://github.com/Themaister/pyrofling"
license=('MIT')
depends=('vulkan-icd-loader' 'ffmpeg' 'libpulse' 'pipewire' 'gtk3' 'dbus' 'libxml2')
makedepends=('cmake' 'git' 'vulkan-headers')
provides=('pyrofling')
conflicts=('pyrofling')
source=("git+https://github.com/Themaister/pyrofling")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pyrofling"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/pyrofling"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/pyrofling"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/pyrofling"
  DESTDIR="$pkgdir" cmake --install build
}
