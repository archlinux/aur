# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-display-git
pkgver=2.2.2.r82.g7098f7b
pkgrel=1
pkgdesc='Switchboard Display Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-display'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'switchboard' 'meson' 'vala')
provides=('switchboard-plug-display')
conflicts=('switchboard-plug-display')
source=('git+https://github.com/elementary/switchboard-plug-display.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-display

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-display build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
