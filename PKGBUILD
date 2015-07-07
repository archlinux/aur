# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Dejan Cabrilo <dcabrilo@bitspan.rs>

pkgname=tdom-git
pkgver=0.8.3.r92.g363cbda
pkgrel=1
pkgdesc="A fast XML/DOM/XPath package for Tcl written in C"
arch=('i686' 'x86_64')
url="http://tdom.github.com/"
license=('MPL')
groups=('devel')
depends=('tcl')
conflicts=('tdom')
provides=('tdom')

source=('git+https://github.com/tDOM/tdom.git')
md5sums=(SKIP)

pkgver() {
  cd tdom
  git describe --long | sed -r 's/^tdom_//;s/_postrelease//;s/_/./g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd tdom

  if [ $CARCH = "x86_64" ] ; then
    ./configure --prefix=/usr --enable-64bit --mandir=/usr/share/man
  else
    ./configure --prefix=/usr --mandir=/usr/share/man
  fi
  make
}

package() {
  cd tdom
  make DESTDIR="${pkgdir}/" install
  rmdir "$pkgdir/usr/bin"
}
