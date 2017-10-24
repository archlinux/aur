# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

_pkgname=execline
pkgname=${_pkgname}-no-conflicts
pkgver=2.3.0.3
pkgrel=2
pkgdesc="A (non-interactive) scripting language, like sh; without import or define"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${_pkgname}/"
license=('ISC')
depends=('skalibs')
conflicts=('execline')
provides=("execline=$pkgver")
source=("http://skarnet.org/software/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1a698425740a410a38be770f98b8faf94c633e29a74ba1d25adddbb294e979f5')

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
