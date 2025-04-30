
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=plank-reloaded-git
pkgver=0.11.123.r0.g680f549
pkgrel=1
pkgdesc='Fork of the original Plank project, providing a simple dock for X11 desktop environments'
arch=('x86_64')
url='https://github.com/zquestz/plank-reloaded'
license=('GPL3')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus'
         'gtk3' 'libgee' 'libwnck3' 'libx11' 'libxfixes' 'libxi' 'pango')
makedepends=('gnome-common' 'git' 'intltool' 'vala' 'meson' 'ninja')
provides=('plank')
conflicts=('plank')
source=('git+https://github.com/zquestz/plank-reloaded.git')
sha256sums=('SKIP')

pkgver() {
  cd plank-reloaded
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd plank-reloaded
  meson setup --prefix=/usr build
  meson configure build -D enable-apport=false
}

build() {
  cd plank-reloaded
  meson compile -C build
}

package() {
  cd plank-reloaded
  meson install --destdir="${pkgdir}" -C build
}

# vim: ts=2 sw=2 et:
