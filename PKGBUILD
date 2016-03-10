# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libratbag-git
pkgver=0.3.r18.765ee6c
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

  git describe | sed 's/^v//; s/-/.r/; s/-g/./'
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
