# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=cal3d
pkgver=0.11.0
pkgrel=7
pkgdesc="A skeletal-based 3D character animation library"
arch=(i686 x86_64)
url="https://mp3butcher.github.io/Cal3D/"
options=(!libtool)
license=(GPL2)
depends=('gcc-libs')
makedepends=('patch')
source=(https://mp3butcher.github.io/Cal3D/sources/cal3d-$pkgver.tar.gz cal3d-gcc43.diff)
sha512sums=('4dc4b36b8f18760bfe6f8c80cbd941c14e2ebe596d0cd514fdb1ae4175bf2706e125665272d67ff21d33bb4b34e7be22bad9c00d488c1da21f442550bf3f204f'
            '8f7694ac240a7cbfc198d8e481ab87901d0256defffb1601f68ef39463bf1471e29e13d147e9a6463113afa0e93f317c2ef99aa19633b4e597e6347c38a64f42')
build() {
  cd "${pkgname}-$pkgver"
  patch -p0 < ../cal3d-gcc43.diff
  sed -i -e "s/return false/return 0/" src/cal3d/loader.cpp
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-$pkgver"
  make DESTDIR=${pkgdir} install
}
