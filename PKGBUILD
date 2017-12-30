# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libratbag-git
pkgver=0.9.901.r1.cbcdc4b
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glib2' 'glibc' 'libevdev'
         'libsystemd.so' 'libudev.so')
makedepends=('doxygen' 'git' 'graphviz' 'meson' 'swig' 'systemd')
conflicts=('libratbag')
provides=('libratbag')
source=('git+https://github.com/libratbag/libratbag.git')
sha256sums=('SKIP')

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
