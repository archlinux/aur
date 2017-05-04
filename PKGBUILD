# Maintainer: David P. <megver83@parabola.nu>
# Contributor Jan de Groot <jgc@archlinux.org>

_pkgname=libatasmart

pkgname=libatasmart-nosystemd
pkgver=0.19
pkgrel=2.aur1
pkgdesc="ATA S.M.A.R.T. Reading and Parsing Library"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libeudev')
makedepends=('eudev')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="http://0pointer.de/blog/projects/being-smart.html"
source=(http://0pointer.de/public/${_pkgname}-${pkgver}.tar.xz
        0001-Dont-test-undefined-bits.patch
        0002-Drop-our-own-many-bad-sectors-heuristic.patch)
md5sums=('53afe2b155c36f658e121fe6def33e77'
         'eb5d0468b0d47d099e5164372a21f9da'
         'cebd1fbed0b05d0458177d6d3ad4ea3f')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../0001-Dont-test-undefined-bits.patch
  patch -Np1 -i ../0002-Drop-our-own-many-bad-sectors-heuristic.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
