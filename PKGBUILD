# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=libtasn1-nodocs-git
pkgver=4.16.0
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS"
arch=('x86_64')
license=('GPL3' 'LGPL')
url="https://www.gnu.org/software/libtasn1/"
depends=('glibc')
source=(git+https://gitlab.com/gnutls/libtasn1.git)
provides=(libtasn1)
conflicts=(libtasn1)
sha256sums=('SKIP')
#validpgpkeys=('1F42418905D8206AA754CCDC29EE58B996865171') #Nikos Mavrogiannopoulos <nmav@gnutls.org>

pkgver() {
  cd libtasn1
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd libtasn1
  ./bootstrap
  ./configure --prefix=/usr --disable-doc
  CODE_COVERAGE_LDFLAGS=${LDFLAGS} make
}

#check() {
#  cd libtasn1
#  make check
#}

package() {
  cd libtasn1
  make DESTDIR="${pkgdir}" install
#  make -C doc/reference DESTDIR="${pkgdir}" install-data-local
}
