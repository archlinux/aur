# Maintainer: Duck Hunt <vaporeon@tfwno.gf>
# Contributor: FallenWizard <fallenwizard@archlinux.us>
pkgname=tripcrunch-svn
pkgver=44
pkgrel=2
pkgdesc="Tripcode generator intended for image boards"
arch=(i686 x86_64)
url="http://code.google.com/p/tripcrunch"
license=('BSD')
makedepends=('subversion')

source=('tripcrunch::svn+http://tripcrunch.googlecode.com/svn/trunk')
md5sums=('SKIP') 

pkgver() {
  cd "$SRCDEST"/tripcrunch
  svnversion
}

build() {
  cd "$srcdir"/tripcrunch
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/tripcrunch
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir"/tripcrunch/COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
