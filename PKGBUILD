# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh-genders
pkgver=2.32
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
sha256sums=('3c58b955b4f5f24e75905a5e133b5d28ce04246566e28701902359adab806765')

build() {
  cd "${srcdir}/pdsh-pdsh-${pkgver}"
  ./bootstrap
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --enable-ltdl-install \
              --with-ssh \
              --with-genders \
              --with-readline
  make
}

check() {
  cd "${srcdir}/pdsh-pdsh-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/pdsh-pdsh-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
