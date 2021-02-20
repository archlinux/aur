# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-screenshot-git
pkgver=1.7.1.r132.ge33fa59
pkgrel=1
pkgdesc='The Pantheon Screenshot Tool'
arch=('x86_64')
url='https://github.com/elementary/screenshot-tool'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gtk3' 'libcanberra' 'libhandy'
         'libgranite.so')
makedepends=('git' 'granite-git' 'intltool' 'meson' 'vala')
provides=('pantheon-screenshot')
conflicts=('pantheon-screenshot')
source=("pantheon-screenshot::git+https://github.com/elementary/screenshot-tool.git")
sha256sums=('SKIP')

pkgver() {
  cd pantheon-screenshot

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed 's/extra/io.elementary.screenshot-tool.extra/' -i pantheon-screenshot/po/extra/meson.build

}

build() {
  arch-meson pantheon-screenshot build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
