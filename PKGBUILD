# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh-genders
pkgver=2.33
pkgrel=2
pkgdesc='Parallel Distributed Shell'
url='https://github.com/chaos/pdsh'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'openssh' 'readline' 'genders')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("https://github.com/chaos/pdsh/releases/download/pdsh-${pkgver}/pdsh-${pkgver}.tar.gz")
conflicts=('pdsh')
provides=('pdsh')
sha256sums=('7368087429d6269f0a6313c406ef38c6a6a947bc003ca7368fc6481b139d942f')

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

check() {
  cd "${srcdir}/pdsh-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/pdsh-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
