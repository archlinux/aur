# Maintainer: Luca Fulchir <luker at fenrirproject.org>
pkgname=libraptorq
pkgver=0.1.10
pkgrel=1
pkgdesc='Forward error correction library implementing RaptorQ algorithm'
arch=('i686' 'x86_64')
url='https://fenrirproject.org'
license=('LGPL3')
depends=('gcc-libs')
optdepends=('eigen: development')
makedepends=('cmake')
source=("https://fenrirproject.org/Luker/libRaptorQ/repository/archive.tar.gz?ref=v${pkgver}")
sha1sums=('2309ae06dd9e91d63e5a2cc9746c3ef1198e1100')
sha256sums=('637ea669f8229a16b4c9e814bae038c11f9a3ef4b3f3c6eeb606e3f7d80aacb4')

build() {
  rm -rf "$srcdir/$pkgname-$pkgver"
  mv ${srcdir}/libRaptorQ-v${pkgver}-* "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build &>/dev/null
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr ../
  make || make || make  # yeah, *sometimes* can fail.
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make install DESTDIR=${pkgdir}

}


