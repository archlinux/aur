# Maintainer: sh0 <mee@sh0.org>

pkgname=pdsh-genders
pkgver=2.22
pkgrel=1
pkgdesc='A high-performance, parallel remote shell utility'
url='https://computing.llnl.gov/linux/pdsh.html'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'openssh' 'readline' 'genders')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("http://downloads.sourceforge.net/pdsh/pdsh-${pkgver}.tar.bz2")
conflicts=('pdsh')
md5sums=('151b7a67079e88da0309a5c60432f4a9')

build() {
  cd "${srcdir}/pdsh-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man \
              --without-rsh \
              --with-ssh \
              --without-machines \
              --without-dshgroups \
			  --without-netgroup \
			  --with-genders \
              --with-readline || return 1
  make || return 1
}

package() {
  cd "${srcdir}/pdsh-${pkgver}"
  make DESTDIR="${pkgdir}/" install || return 1
  rm -fr "${pkgdir}/usr/sbin"
}

# vim:set ts=2 sw=2 et:
