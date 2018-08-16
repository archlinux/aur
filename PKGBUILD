# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libratbag-git
pkgver=0.9.902.r34.e43cf7a
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glib2' 'libevdev' 'python'
         'libsystemd.so' 'libudev.so')
makedepends=('git' 'meson' 'swig' 'systemd')
conflicts=('libratbag')
provides=('libratbag')
source=('git+https://github.com/libratbag/libratbag.git')
sha256sums=('SKIP')

pkgver() {
  cd libratbag

  git describe | sed 's/^v//; s/-/.r/; s/-g/./'
}

build() {
  arch-meson libratbag build \
    -Dtests='false'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 libratbag/COPYING -t "${pkgdir}"/usr/share/licenses/libratbag-git/
}

# vim: ts=2 sw=2 et:
