# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Andy Kluger <andykluger@gmail.com>

_pkgname=execline
pkgname=${_pkgname}-no-conflicts
pkgver=2.1.5.0
pkgrel=1
pkgdesc="A (non-interactive) scripting language, like sh, without import or define"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${_pkgname}/"
license=('ISC')
depends=('skalibs')
conflicts=('execline')
provides=('execline')
source=("http://skarnet.org/software/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8a3605a6db73183baa376bf2130e8b7eb75a5b5347c7f9144e520fe86bcb1142')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for bin in import define; do
    rm ${pkgdir}/usr/bin/${bin}
  done
}

# vim:ft=sh ts=2 sw=2 et:
