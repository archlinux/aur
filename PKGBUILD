# Maintainer: drrossum <d.r.vanrossum at gmx.de>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh
pkgver=2.34
pkgrel=1
pkgdesc='Parallel Distributed Shell'
url='https://github.com/chaos/pdsh'
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssh')
makedepends=('autoconf')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("https://github.com/chaos/pdsh/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('75916c61a469303ff859605b1375d391')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man \
              --without-rsh \
              --with-ssh \
              --with-dshgroups \
              --with-readline || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install || return 1
}

# vim:set ts=2 sw=2 et:
