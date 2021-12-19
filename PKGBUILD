# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xtrans13
_pkgname=xtrans
pkgver=1.3.5
pkgrel=2
pkgdesc="X transport library"
arch=('any')
license=('custom')
url="https://xorg.freedesktop.org/"
options=(!emptydirs)
provides=("$_pkgname=$pkgver-$pkgrel")
conflicts=("$_pkgname")
source=(${url}/releases/individual/lib/${_pkgname}-${pkgver}.tar.bz2{,.sig})
sha512sums=('049fb996313e8a1625b66e1645a5f56d8a26c5dd91afe5869269716fce05f6c97c84f8ce4a6df2057106b47982c8291cecc223bef241f694174434c981a7029b'
            'SKIP')
validpgpkeys=('C383B778255613DFDB409D91DB221A6900000011') #  "Keith Packard <keithp@keithp.com>"

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr 
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  install -m755 -d "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/share/pkgconfig" "${pkgdir}/usr/lib/pkgconfig"
}
