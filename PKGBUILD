# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=mesmer
_PkgName=Mesmer
pkgver=6.1
pkgrel=1
pkgdesc="An open-source master equation solver for multi-energy well reactions"
url="https://sourceforge.net/projects/mesmer"
arch=("x86_64")
license=("GPL2")
depends=('qd' 'tinyxml' 'openmpi')
makedepends=('gcc')
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName$pkgver-source.tar.gz")
sha256sums=('c16b81c6bf220cebeca6ebe235e65051162bf0aad496879329041e071e8278b9')
options=(!makeflags)

build() {
  cd "$srcdir/$_PkgName$pkgver-source/$_PkgName$pkgver/src"
  make install \
       PARALLEL=YES \
       DEBUG=NO \
       LIBS="-lqd -ltinyxml -L/usr/lib/openmpi -lmpi_cxx -lmpi" \
       INCS="-I/usr/include"
}

package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir/$_PkgName$pkgver-source/$_PkgName$pkgver/src/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
}
