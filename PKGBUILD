# Maintainer: drrossum <d.r.vanrossum at gmx.de>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh
pkgver=2.29
pkgrel=2
pkgdesc='Parallel Distributed Shell'
url='http://code.google.com/p/pdsh/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'openssh' 'readline')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("http://pdsh.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
md5sums=('e3512d03e491de6f1a735ab0ff702108')

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
  rmdir "${pkgdir}/usr/sbin"
}

# vim:set ts=2 sw=2 et:
