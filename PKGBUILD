# Maintainer: Luca Fulchir <luker at fenrirproject.org>
pkgname=libraptorq
pkgver=0.1.9
pkgrel=1
pkgdesc='Forward error correction library implementing RaptorQ algorithm'
arch=('i686' 'x86_64')
url='https://www.fenrirproject.org'
license=('LGPL3')
depends=('gcc-libs')
optdepends=('eigen: development')
makedepends=('cmake')
source=("https://www.fenrirproject.org/Luker/libRaptorQ/repository/archive.tar.gz?ref=v${pkgver}")
sha1sums=('a761ef4baa01310462f05001e88939843401559f')
sha256sums=('7b7aebd45258726bfd94fbf65bc8e3f687f2951654498f7588903ffe60c59cce')

build() {
  rm -rf "$srcdir/$pkgname-$pkgver"
  mv "$srcdir/libRaptorQ-v$pkgver-bfeb4cd0fcfbb5ede2fdafcca70f54c410eb4421" "$srcdir/$pkgname-$pkgver"
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


