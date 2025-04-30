
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=plank-reloaded
pkgver=0.11.123
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
source=("https://github.com/zquestz/plank-reloaded/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f71fecd96c8d6b6a3fc981b79773f68e04ce86efcfe59e5cd59d63e2afef8dbb')

prepare() {
  cd plank-reloaded-${pkgver}
  meson setup --prefix=/usr build
  meson configure build -D enable-apport=false -D production-release=true
}

build() {
  cd plank-reloaded-${pkgver}
  meson compile -C build
}

package() {
  cd plank-reloaded-${pkgver}
  meson install --destdir="${pkgdir}" -C build
}

# vim: ts=2 sw=2 et:
