# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

_pkgname=skabus
pkgname=${_pkgname}-git
pkgver=r40.a50a007
pkgrel=1
pkgdesc="A suite of programs and libraries for Unix systems that aim to implement a bus, i.e. a many-to-many interprocess communication mechanism"
arch=('i686' 'x86_64')
url="http://skarnet.org/software/${_pkgname}/"
license=('ISC')
makedepends=('git')
depends=('s6' 'skalibs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
# source=("http://skarnet.org/software/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
source=("git://git.skarnet.org/skabus")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # cd "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr \
              --datadir=/etc
  make
}

package() {
  # cd "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}"
  DESTDIR=${pkgdir} make install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
