# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-printers-git
pkgver=2.1.9.r37.gbf89c63
pkgrel=1
pkgdesc='Switchboard Printers Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-printers'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libcups' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-printers')
conflicts=('switchboard-plug-printers')
source=('git+https://github.com/elementary/switchboard-plug-printers.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-printers

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-printers build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
