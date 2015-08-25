# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=4.4
pkgrel=1
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/d/debianutils.html"
license=('GPL')
depends=('run-parts' 'which')
source=(http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('c0cb076754d7f4eb1e3397d00916647f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  msg 'Remove files of "which" and "run-parts" package...'
  cd 
  find "${pkgdir}" -name which* -delete
  find "${pkgdir}" -name run-parts* -delete
}
