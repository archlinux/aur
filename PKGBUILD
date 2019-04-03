# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=scim-hangul
pkgver=0.4.0
pkgrel=4
pkgdesc='Korean input method module for SCIM'
url='https://github.com/choehwanjin/scim-hangul'
license=('GPL')
arch=('x86_64')
depends=('libhangul' 'scim')
source=($pkgname-$pkgver.tar.gz::"https://github.com/choehwanjin/scim-hangul/archive/v${pkgver}.tar.gz"
        '2012.patch')
sha256sums=('3b03a8a31ce662158894eaaf6e9b19c7d3b648fbb2a005a2ca09115277dce638'
            'dbb0358ef40c9ccb938571304e9f0844a67b4aeb5f1c8995ea62b2ae54aae9cc')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../2012.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./bootstrap
  ./configure --prefix=/usr --enable-skim-support
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
