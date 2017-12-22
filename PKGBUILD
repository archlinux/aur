# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libratbag-git
pkgver=0.8.r2.2b92ab6
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev'
         'libudev.so')
makedepends=('doxygen' 'git' 'graphviz' 'systemd' 'meson')
source=('git+https://github.com/libratbag/libratbag.git')
sha256sums=('SKIP')
conflicts=('libratbag')
provides=('libratbag')

pkgver() {
  cd libratbag

  git describe | sed 's/^v//; s/-/.r/; s/-g/./'
}

prepare() {
  cd libratbag

  if [[ -d build ]]; then
    rm -rf build
  fi
  meson build \
    --prefix='/usr' \
    -Denable-tests='false'
}

build() {
  cd libratbag

  ninja -C build
}

package() {
  cd libratbag

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/libratbag-git/
}

# vim: ts=2 sw=2 et:
