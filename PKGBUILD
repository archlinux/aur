# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-shortcut-overlay-git
pkgver=1.1.2.r36.g8e3ba1f
pkgrel=1
pkgdesc='A native, OS-wide shortcut overlay'
arch=('x86_64')
url='https://github.com/elementary/shortcut-overlay'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so')
makedepends=('git' 'granite-git' 'meson' 'vala')
provides=('pantheon-shortcut-overlay')
conflicts=('pantheon-shortcut-overlay')
source=('pantheon-shortcut-overlay::git+https://github.com/elementary/shortcut-overlay.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-shortcut-overlay

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson pantheon-shortcut-overlay build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
