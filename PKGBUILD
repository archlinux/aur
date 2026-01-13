# Maintainer: Moises Baltazar <null@moisesb.com>
# Contributor: drrossum <d.r.vanrossum at gmx.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh-genders
pkgver=2.36
pkgrel=1
pkgdesc='Parallel Distributed Shell with Genders Database support'
url='https://github.com/chaos/pdsh'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'openssh' 'readline' 'genders')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("https://github.com/chaos/pdsh/releases/download/pdsh-${pkgver}/pdsh-${pkgver}.tar.gz"
        patch)
conflicts=('pdsh')
provides=('pdsh')
sha256sums=('a661095ce51dd5fb05e398cf5d0e1d63157123958441f6d3512bcf1a7d25c517'
            'd68600178b2d404dcd0719147263bc8caae0bdde5347ceee46164da9e890a424')

build() {
  cd "${srcdir}/pdsh-${pkgver}"
  patch -Np1 < ../patch
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --without-rsh \
              --with-ssh \
              --with-genders \
              --with-readline
  make
}

package() {
  cd "${srcdir}/pdsh-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
