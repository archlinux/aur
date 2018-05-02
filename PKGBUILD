# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-dpms-helper-git
pkgver=r6.6e0d292
pkgrel=1
pkgdesc='Script and settings for X DPMS'
arch=('any')
url='https://code.launchpad.net/~elementary-pantheon/elementaryos/pantheon-dpms-helper'
license=('GPL')
groups=('pantheon-unstable')
depends=('gnome-settings-daemon')
provides=('pantheon-dpms-helper' 'pantheon-dpms-helper-bzr')
conflicts=('pantheon-dpms-helper')
replaces=('pantheon-dpms-helper-bzr')
makedepends=('git' 'meson')
source=('git+https://github.com/elementary/dpms-helper')
sha256sums=('SKIP')

pkgver() {
  cd dpms-helper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/dpms-helper
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd $srcdir/dpms-helper

  DESTDIR="${pkgdir}" ninja -C build install

  install -dm 755 "${pkgdir}"/etc/xdg/autostart
  install -m 644 data/io.elementary.dpms-helper.desktop "${pkgdir}"/etc/xdg/autostart/pantheon-dpms-helper.desktop
}

# vim: ts=2 sw=2 et:
