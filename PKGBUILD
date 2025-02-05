# Maintainer: Nikolay Kuznetsov <nikola_tesla_96@outlook.com>
pkgname=tt_riing_quad_fan_control
pkgver=0.1
pkgrel=1
pkgdesc="Experimental fan control application for Thermaltake Riing Quad controllers (Unstable & Nvidia only)"
arch=('x86_64')
url="https://github.com/At1ass/tt_riing_quad_fan_control"
license=('MIT')
depends=('gtk3' 'libayatana-appindicator' 'hidapi' 'nvidia-utils' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'pkgconf')
source=("git+https://github.com/At1ass/tt_riing_quad_fan_control.git")
sha256sums=('SKIP')  # Для git-источника можно использовать SKIP

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release .. || return 1
  make -j$(nproc) || return 1
}

package() {
  cd "$srcdir/$pkgname/build"
  # Устанавливаем файлы в директорию, указанную в $pkgdir.
  make DESTDIR="$pkgdir/" install || return 1
}
