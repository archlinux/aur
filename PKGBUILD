# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-screenshot-git
pkgver=1.7.1.r88.ged7980f
pkgrel=1
pkgdesc='The Pantheon Screenshot Tool'
arch=('x86_64')
url='https://github.com/elementary/screenshot-tool'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 
         'gtk3' 'libcanberra' 'libhandy1'
         'libgranite.so')
makedepends=('git' 'granite' 'intltool' 'meson' 'vala')
provides=('pantheon-screenshot')
conflicts=('pantheon-screenshot')
source=("pantheon-screenshot::git+https://github.com/elementary/screenshot-tool.git"
        "0001-support-libhandy1.patch")
sha256sums=('SKIP'
            'b300a47911342fbe1cf22ccae0287b53ca584bff873d3491ef480687d8d9933a')

pkgver() {
  cd pantheon-screenshot

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed 's/extra/io.elementary.screenshot-tool.extra/' -i pantheon-screenshot/po/extra/meson.build

   cd pantheon-screenshot
   patch -Np1 -i ../0001-support-libhandy1.patch
}

build() {
  arch-meson pantheon-screenshot build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
