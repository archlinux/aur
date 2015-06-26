# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=cmuclmtk-svn
pkgver=r12596
pkgrel=1
pkgdesc="Language model tools for CMU Sphinx (svn version)"
arch=('i686' 'x86_64')
url="http://cmusphinx.sourceforge.net"
license=('BSD')
depends=()
makedepends=('subversion')
provides=('cmuclmtk')
conflicts=('cmuclmtk')
source=("$pkgname::svn+https://svn.code.sf.net/p/cmusphinx/code/trunk/cmuclmtk/") 
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
