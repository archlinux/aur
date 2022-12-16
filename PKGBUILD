# Maintainer: Valère Monseur <archlinux at vale dot re>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.3.2
pkgrel=1
pkgdesc='The nice editor, a fast small powerful and simple to use editor'
arch=(i686 x86_64)
url='http://ne.di.unimi.it'
license=(GPL3)
depends=(ncurses texinfo)
source=("https://github.com/vigna/${pkgname}/archive/${pkgver}.tar.gz"
        "info2src.pl.patch")
sha512sums=('591be3eb44419ce5fec8c2a02c06aab95dc7d04aa8eb191219588af1b8851ae86e11b8eace25fa970817ac6451c991354e8c20d591dd4fb45114e1cdb6dd1ec6'
            '0c95be21e40572d3feb5db4e73fea67616a5a8b8d4570511bc9267b0ed59c75b2169881faa23adcec8e4f16ea771ba28c12f90b2876672bda3d39796d894a089')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}"/info2src.pl.patch
}

build() {
  cd ${pkgname}-${pkgver}
  make -j1 PREFIX=/usr LIBS="-lcurses -ltinfo"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" LIBS="-lcurses -ltinfo" install
}
