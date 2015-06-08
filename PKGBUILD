# Maintainer: 2ion <dev@2ion.de>
pkgname=abook-git
pkgver=0.6.0pre2.r71.gb83bcbf
pkgrel=1
pkgdesc="Text-based addressbook program designed to use with mutt mail client"
arch=('x86_64' 'i686')
url="http://abook.sourceforge.net/"
license=('GPL')
depends=('readline' 'ncurses')
makedepends=('git' 'autoconf' 'automake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+git://git.code.sf.net/p/abook/git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --tags | sed 's/ver_//;s/_/./g;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf --force --install --symlink
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make -k check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
