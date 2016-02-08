# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
pkgname=debianutils
pkgver=4.7
pkgrel=1
pkgdesc="Miscellaneous utilities specific to Debian"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/d/debianutils.html"
license=('GPL')
depends=('run-parts' 'which')
source=(http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz)
md5sums=('00186f527b35e2cecd4db593c6d512d0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  msg 'Remove files of "which" and "run-parts" package...'
  cd 
  find "${pkgdir}" -name which* -delete
  find "${pkgdir}" -name run-parts* -delete
}
