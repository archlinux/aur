# Maintainer: Daniel Krueger <keenbug gmail.com>
# Contributor: Daniel Oliveira <psykond@gmail.com>
pkgname=guile-gnome-platform-git
_pkgname=guile-gnome-platform
pkgver=2.16.2.r11.g0fcbe69
pkgrel=1
epoch=1
pkgdesc="Binding between Guile Scheme and the Gnome stack of libraries. (fe. Pango, GTK+, Cairo, GStreamer, Glade, GtkSourceView and else). To build wrappers for GTK+ and higher in the stack, you will first need Guile-Cairo."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/guile-gnome/"
license=('GPL2')
depends=('g-wrap' 'guile-cairo' 'libgnomeui')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
install=guile-gnome-platform-git.install
options=(!libtool)
source=("$_pkgname::git://git.sv.gnu.org/guile-gnome.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}
package() {	
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
}
