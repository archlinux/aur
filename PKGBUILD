# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
# Contributor Yigit Dallilar  <yigit.dallilar@gmail.com>

pkgname=cdsclient
pkgver=4.07
pkgrel=1
pkgdesc="a set of C and csh routines o query some databases located at CDS or on mirrors over the network"
url="https://vizier.cds.unistra.fr/vizier/doc/cdsclient.html"
arch=("x86_64")
license=("GPL-3.0-only")
depends=("glibc" "python" "sh" "tcsh")
source=(
  "${pkgname}-${pkgver}.tar.gz::http://cdsarc.cds.unistra.fr/ftp/pub/sw/cdsclient.tar.gz"
  "${pkgname}-${pkgver}.patch"
)
sha512sums=(
  "9f1aeabf3714ba5c972c1da4cbbfc903635b511f2cf5ad6b53a9234cf3cfba74a06ba70d1d961620eaa57dfee7027479467689e9e03ceb032448281e6542cc9e"
  "291ce57bb7ee92bc02fdc88ccdb4697357b8698ede4fd3d93f1907db54433eea6e8c5c60ff2470be1daec21a216ef77f62fd7f7eb793ecac3330b6d16ee4affd"
)

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -p1 -i "../${pkgname}-${pkgver}.patch"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX="$pkgdir/usr" install
}

