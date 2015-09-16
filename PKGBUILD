# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libratbag-git
pkgver=r453.e514da8
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev'
         'libudev.so')
makedepends=('chrpath' 'git' 'systemd')
source=('git+https://github.com/libratbag/libratbag.git')
sha256sums=('SKIP')

pkgver() {
  cd libratbag

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libratbag

  ./autogen.sh \
    --prefix='/usr'\
    --disable-static
  make
}

package() {
  cd libratbag

  make DESTDIR="${pkgdir}" install
  chrpath -d "${pkgdir}"/usr/bin/ratbag-command

  install -dm 755 "${pkgdir}"/usr/share/licenses/libratbag-git
  install -m 644 COPYING "${pkgdir}"/usr/share/licenses/libratbag-git/
}

# vim: ts=2 sw=2 et:
