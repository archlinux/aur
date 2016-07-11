# Maintainer: drrossum <d.r.vanrossum at gmx.de>
# Contributor: sh0 <mee@sh0.org>

pkgname=pdsh
pkgver=2.31
pkgrel=1
pkgdesc='Parallel Distributed Shell'
url='https://github.com/grondo/pdsh'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc' 'openssh' 'readline')
optdepends=('perl: required by the dshbak utility')
options=('libtool')
source=("https://github.com/grondo/pdsh/archive/pdsh-2.31.tar.gz")
md5sums=('cab34b0ca78f3cf596fd648b265223ed')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man \
              --without-rsh \
              --with-ssh \
              --with-dshgroups \
              --with-readline || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install || return 1
  rmdir "${pkgdir}/usr/sbin"
}

# vim:set ts=2 sw=2 et:
