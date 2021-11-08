# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>

pkgname=sbsms
pkgver=0.0.0
pkgrel=1
epoch=1
pkgdesc="A command line time-stretching / pitch-shifting tool"
arch=('x86_64')
url="https://sourceforge.net/projects/sbsms/files/sbsms-app/"
license=('GPL2')
depends=('libsbsms' 'libsndfile' 'libmad')
options=('!staticlibs')
source=("https://sourceforge.net/projects/sbsms/files/sbsms-app/sbsms-app-$pkgver.tar.gz")
sha512sums=('f7da91d4d750906bb26afdb72419c71a09c20ba3121678686abe3ad85f4ae57bd36c9fa490fb07d6fbb893ec271ea23337d5c41b54c26e52025e4a4ce4bc5693')

# missing -pthread
prepare() {
  cd $pkgname-app-$pkgver
  sed -i '/^LT_INIT/a LIBS="-pthread $LIBS"' configure.in
  aclocal
  autoconf
  automake --add-missing
}

build() {
  cd $pkgname-app-$pkgver
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd $pkgname-app-$pkgver
  make DESTDIR="$pkgdir/" install
}
