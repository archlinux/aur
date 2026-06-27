# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=mesmer
_PkgName=Mesmer
pkgver=7.1
pkgrel=1
pkgdesc="An open-source master equation solver for multi-energy well reactions"
url="https://sourceforge.net/projects/mesmer"
arch=(x86_64 aarch64)
license=(GPL-2.0-or-later)
depends=(qd tinyxml openmpi)
makedepends=(gcc)
source=(https://downloads.sourceforge.net/$pkgname/$_PkgName$pkgver-source.tar.gz)
sha256sums=('7f9423d627f17ddbfabeac2a4d37d7db8f5702ca44f318d7403b16c19aa27690')
options=(!makeflags)

build() {
  cd "$srcdir/$_PkgName$pkgver-source/src"
  make install \
    PARALLEL=YES \
    DEBUG=NO \
    LIBS="-lqd -ltinyxml -L/usr/lib/openmpi -lmpi" \
    INCS="-I/usr/include"
}

package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir/$_PkgName$pkgver-source/src/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
}
