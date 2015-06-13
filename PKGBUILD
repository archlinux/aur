# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=sctp-refimpl-svn
pkgver=r9101
pkgrel=1
pkgdesc="Reference implementation for SCTP in user space."
arch=('i686' 'x86_64')
url="https://sctp-refimpl.googlecode.com/svn/trunk/KERN/usrsctp/"
license=('BSD')
depends=('glibc')
makedepends=('subversion' 'libtool' 'automake' 'autoconf' 'gcc' 'make')
#provides=(libusrsctp)

source=('svn+https://sctp-refimpl.googlecode.com/svn/trunk/KERN/usrsctp/')
md5sums=('SKIP')
_svnname="usrsctp"

pkgver() {
  cd "$_svnname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"/${_svnname}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() { 
  cd "$srcdir"/${_svnname}
  DESTDIR="$pkgdir/" make install
} 

