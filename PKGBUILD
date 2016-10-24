# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh-genders
pkgver=2.31
pkgrel=1
pkgdesc='Parallel Distributed Shell'
url='https://github.com/grondo/pdsh'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'openssh' 'readline' 'genders')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("https://github.com/grondo/pdsh/archive/pdsh-${pkgver}.tar.gz")
conflicts=('pdsh')
provides=('pdsh')
sha256sums=('0ee066ce395703285cf4f6cf00b54b7097d12457a4b1c146bc6f33d8ba73caa7')

build() {
  cd "${srcdir}/pdsh-pdsh-${pkgver}"
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
  cd "${srcdir}/pdsh-pdsh-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rmdir "${pkgdir}/usr/sbin"
}

# vim:set ts=2 sw=2 et:
