# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=kmsxx-git
_pkgname=kmsxx
pkgver=r637.adc05b6
pkgrel=2
pkgdesc='C++17 library for kernel mode setting'
arch=('armv7h' 'aarch64')
url="https://github.com/tomba/kmsxx"
license=('Mozilla 2.0')
depends=(libdrm python fmt)
makedepends=(meson ninja git cmake fmt pybind11)
provides=('kmsxx')
source=('git+https://github.com/tomba/kmsxx.git')
b2sums=('SKIP')

pkgver() {
    cd kmsxx
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd kmsxx

  git submodule update --init
  meson --prefix=/usr --sbindir=bin build
  ninja -C build
}

package () {
  cd kmsxx

  DESTDIR="$pkgdir" meson install -C build
}
