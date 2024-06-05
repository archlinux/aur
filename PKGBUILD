# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calculator-git
pkgver=8.0.0.r7.g160859b
pkgrel=1
pkgdesc='The Pantheon Calculator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/calculator'
license=('GPL-3.0-or-later')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk4'
         'libgranite-7.so')
makedepends=('git' 'granite7' 'intltool' 'meson' 'vala')
provides=('pantheon-calculator')
conflicts=('pantheon-calculator')
source=('pantheon-calculator::git+https://github.com/elementary/calculator.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-calculator
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed 's/extra/io.elementary.calculator.extra/' -i pantheon-calculator/po/extra/meson.build
}

build() {

  arch-meson pantheon-calculator build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
