# Maintainer: Jaume Delclòs <jaume@delclos.com>
# Contributor: Daniel Krueger <keenbug gmail.com>
# Contributor: Daniel Oliveira <psykond@gmail.com>
pkgname=guile-gnome-platform
_pkgname=guile-gnome
pkgver=2.16.3
pkgrel=1
epoch=1
pkgdesc="Binding between Guile Scheme and the Gnome stack of libraries. (fe. Pango, GTK+, Cairo, GStreamer, Glade, GtkSourceView and else). To build wrappers for GTK+ and higher in the stack, you will first need Guile-Cairo."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/guile-gnome/"
license=('GPL2')
depends=('g-wrap' 'guile-cairo' 'libgnomeui')
makedepends=('gcc49')
provides=($pkgname)
conflicts=($pkgname)
install=guile-gnome-platform.install
options=(!libtool)
# once it's available, switch to this url
#source=("http://ftp.gnu.org/pub/gnu/guile-gnome/$pkgname/$pkgname-$pkgver.tar.gz")
source=("http://git.savannah.gnu.org/cgit/guile-gnome.git/snapshot/guile-gnome-$pkgver.tar.gz")
md5sums=('0f48e1a90c72d813e47b567e03264ac1')

pkgver() {
  cd $_pkgname-$pkgver
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $_pkgname-$pkgver
  ./autogen.sh --prefix=/usr
}

build() {
  cd $_pkgname-$pkgver
  CC=gcc-4.9 ./configure --prefix=/usr
  make
}
package() {	
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
