# Maintainer : JulioJu  < juanes  0890  at google mail dot com >
# Contributor: JulioJu  < juanes  0890  at google mail dot com >

pkgname=uml_utilities
pkgver=20070815
pkgrel=1
pkgdesc="User Mode Linux Utilities (Debian package uml-utilities). It contains uml_net, uml_mconsole, uml_switch, tunctl, … and the lib port-helper."
arch=(i686 x86_64)
depends=('fuse' 'readline')
provides=('')
conflicts=('')
url="http://user-mode-linux.sourceforge.net/"
source=( "http://user-mode-linux.sourceforge.net/${pkgname}_${pkgver}.tar.bz2")
license=('GPL2')
md5sums=('b0468ac8b79cef53f36f5f9517907462')

prepare() {
  cd "$srcdir/tools-$pkgver"
  sed 's|lib64|lib|g' -i Makefile || return 3
}

build() {
  cd "$srcdir/tools-$pkgver"
  make
}

package() {
  cd "$srcdir/tools-$pkgver"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin/" && rmdir "$pkgdir/usr/sbin/" || return 4
  chown root "$pkgdir/usr/bin/"*
}
