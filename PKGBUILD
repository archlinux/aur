# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=jwmtools-git
pkgver=4689c0b
pkgrel=2
pkgdesc="Various tools for jwm window manager."
arch=('i686' 'x86_64')
url="https://github.com/kostelnik/jwmtools"
license=('GPL')
groups=('x11')
depends=('mdsplib' 'libglade' 'libxss')
makedepends=('git')
options=('!buildflags')
source=('git://github.com/kostelnik/jwmtools.git')
md5sums=('SKIP') 
install=jwmtools.install
_gitname=jwmtools

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}


build() {

  cd "$srcdir/$_gitname/movemousecursor"
  sed -e "s|cairo|x11 cairo|" -i Makefile
  cd "$srcdir/$_gitname/traykeymap"
  sed -e "s|cairo|x11 cairo|" -i Makefile
  sed -e "s|-Wstrict-prototypes||" -i Makefile
  cd "$srcdir/$_gitname/xidletools"
  sed -e "s|cairo|x11 cairo|" -i Makefile
  cd "$srcdir/$_gitname/"
  make clean all
}

package() {
  cd "$srcdir/$_gitname"
    sed -e "s|/opt/|$pkgdir/opt/|" -i config.mk
  make DESTDIR="$pkgdir/" install
}
