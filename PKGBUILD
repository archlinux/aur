# Maintainer: jerry73204 <jerry73204@gmail.com>
# Previous maintainer: spider-mario <spidermario@free.fr>
pkgname=csmith
pkgver=2.2.0
pkgrel=1
pkgdesc="Tool for stress-testing compilers, static analyzers, and other tools that process C code"
arch=('i686' 'x86_64')
url="http://embed.cs.utah.edu/csmith/"
license=('custom:BSD')
depends=('perl')
source=(csmith.sh
        "https://embed.cs.utah.edu/csmith/${pkgname}-${pkgver}.tar.gz")
md5sums=('75128bd5310cbc1c139b696da3b8e4d8'
         '05682b96f6607b00426d42718b9c2fd6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install

  install --directory "${pkgdir}/etc/profile.d/"
  install ../../csmith.sh "${pkgdir}/etc/profile.d/"

  install --directory "${pkgdir}/usr/share/licenses/${pkgname}/"
  install COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
