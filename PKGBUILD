# Maintainer: Moises Baltazar <null@moisesb.com>
# Contributor: drrossum <d.r.vanrossum at gmx.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh
pkgver=2.35
pkgrel=1
pkgdesc='Parallel Distributed Shell with Genders Database support'
url='https://github.com/chaos/pdsh'
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssh' 'genders')
makedepends=('autoconf')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
conflicts=('pdsh')
provides=('pdsh')
source=("https://github.com/chaos/pdsh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
  patch)
sha256sums=('75ef15347848fff43f8d6ff9c4424fe05c7dd2cdba029139901f861a05093cfe'
            'd68600178b2d404dcd0719147263bc8caae0bdde5347ceee46164da9e890a424')

build() {
  cd "${pkgname}-${pkgver}"
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
