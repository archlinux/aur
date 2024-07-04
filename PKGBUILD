# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=aiksaurus
pkgver=1.2.1
pkgrel=10
pkgdesc="A cross-platform, open-source thesaurus"
url="http://aiksaurus.sourceforge.net/"
license=('GPL')
arch=('x86_64')
depends=('gcc-libs')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz
        aiksaurus-gcc44.patch
        format-security.patch)
sha512sums=('48591850f28f1a8f4b4986df14090ef7bd57cbfbad739cb0013db021f6f5bcb3c592b38e36774735499e27b9e99330504f8d9c6022158e25469cbc81d13f7463'
            '66db53f7499425eb1ff572df4a674f378ed681edeb48ea5926b21d39c8a399c36740e03de101e23a47e043fcce29f66a03c64dc813dc5beda1043d0057711fa5'
            '72ebdc63cbb2c56bd8274f92501cbbae8c66e7d81b11b8fdeda38149da4bf44ab88699d248093eedc9813f6cd60e2a1f360fb39d778b4b7827777b1d003ab1dc')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../format-security.patch
  patch -p0 < ../aiksaurus-gcc44.patch
}

build() {
  cd ${pkgname}-${pkgver}

  export CXXFLAGS+=' -std=c++14'
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
