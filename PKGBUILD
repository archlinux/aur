# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=mesmer
_PkgName=Mesmer
pkgver=6.0
pkgrel=1
pkgdesc="An open-source master equation solver for multi-energy well reactions"
url="https://sourceforge.net/projects/mesmer"
arch=("x86_64")
license=("GPL2")
depends=('qd' 'tinyxml' 'openmpi')
makedepends=('gcc')
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName$pkgver-source.tar.gz")
sha256sums=('a19de9826ae06b61e6e80b5581a116b3fa5e922bf94e117a3af68d4f0803b785')

build() {
  cd "$srcdir/$_PkgName$pkgver/src"
  make -j1 install PARALLEL=YES DEBUG=NO LIBS='-lqd -ltinyxml -L/usr/lib/openmpi -lmpi_cxx -lmpi'
}

package() {
  cd "$pkgdir"
  install -dm755 usr/bin
  install -m755 "$srcdir/$_PkgName$pkgver/src/$pkgname" usr/bin
}
