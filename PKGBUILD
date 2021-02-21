# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-power-git
pkgver=2.4.2.r64.g7cfc557
pkgrel=1
pkgdesc='Switchboard Power Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-power'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gnome-settings-daemon' 'gtk3' 'libgee' 'polkit'
         'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-power')
conflicts=('switchboard-plug-power')
source=('git+https://github.com/elementary/switchboard-plug-power.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-power

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  arch-meson switchboard-plug-power build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
