# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
# Contributor Yigit Dallilar  <yigit.dallilar@gmail.com>

pkgname=cdsclient
pkgver=3.84
pkgrel=2
pkgdesc="a set of C and csh routines o query some databases located at CDS or on mirrors over the network"
url="https://vizier.cds.unistra.fr/vizier/doc/cdsclient.html"
arch=("x86_64")
license=("GPL3")
depends=("glibc")
optdepends=("sh" "tcsh")
source=(
  "${pkgname}-${pkgver}.tar.gz::http://cdsarc.cds.unistra.fr/ftp/pub/sw/cdsclient.tar.gz"
  "${pkgname}-${pkgver}.patch"
)
sha512sums=(
  "2d7abf0079189b9dd19cb8919061445fd19ea9f7dfd54e8ceee26b743218cf62ab00eba0147abe82d9294223927f04b4cc3328620dfc9184a7049f8d515b29e4"
  "d51aac0fc5f578aa2e09a4b59fe71cfd5e3b08ca19f4913ffe73e120e2e0bc1eb3eca56ade221f98605d3a47b7b0cfcf2f49d74921127ac404eda208897acfb5"
)

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -p1 -i "../${pkgname}-${pkgver}.patch"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export LDFLAGS="-Wl,-z,now" 
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX="$pkgdir/usr" install
}

