
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=plank-reloaded
pkgver=0.11.137
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
sha256sums=('f85760e0a1f75d77b0728dba87cb1847e4cf5c69145ed67b554d7f7f01663791')

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
