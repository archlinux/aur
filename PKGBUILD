# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=aiksaurus
pkgver=1.2.1
pkgrel=6
pkgdesc="A cross-platform, open-source thesaurus"
url="http://aiksaurus.sourceforge.net/"
license=('GPL')
arch=('x86_64')
depends=('gtk2')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'aiksaurus-gcc44.patch')
sha512sums=('48591850f28f1a8f4b4986df14090ef7bd57cbfbad739cb0013db021f6f5bcb3c592b38e36774735499e27b9e99330504f8d9c6022158e25469cbc81d13f7463'
            '66db53f7499425eb1ff572df4a674f378ed681edeb48ea5926b21d39c8a399c36740e03de101e23a47e043fcce29f66a03c64dc813dc5beda1043d0057711fa5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # gcc44 build patch
  patch -Np0 -i ${srcdir}/aiksaurus-gcc44.patch

  ./configure --prefix=/usr --with-gtk
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
