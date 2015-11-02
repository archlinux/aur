# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh-genders
pkgver=2.29
pkgrel=2
pkgdesc='Parallel Distributed Shell'
url='http://code.google.com/p/pdsh/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'openssh' 'readline' 'genders')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("http://pdsh.googlecode.com/files/pdsh-${pkgver}.tar.bz2")
conflicts=('pdsh')
provides=('pdsh')
sha256sums=('57f0903bf782afe00874267b59e0f4adefa79da4c48d0257c5ae2bef02f87fcf')

build() {
  cd "${srcdir}/pdsh-${pkgver}"
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --enable-ltdl-install \
              --with-ssh \
              --with-genders \
              --with-readline
  make
}

package() {
  cd "${srcdir}/pdsh-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rmdir "${pkgdir}/usr/sbin"
}

# vim:set ts=2 sw=2 et:
