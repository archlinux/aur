# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

_pkgname=execline
pkgname=${_pkgname}-no-conflicts
pkgver=2.5.0.1
pkgrel=1
pkgdesc="A (non-interactive) scripting language, like sh; renamed 'define' 'xl-define'"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${_pkgname}/"
license=('ISC')
makedepends=('skalibs')
depends=('skalibs')
conflicts=('execline')
provides=("execline=$pkgver")
source=("http://skarnet.org/software/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8d07d14e9e9abb1301e08be271313c4ffa5ddf7248fd262dda19588e78e31049')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv ${pkgdir}/usr/bin/define ${pkgdir}/usr/bin/xl-define
}

# vim:ft=sh ts=2 sw=2 et:
