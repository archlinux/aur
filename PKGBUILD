# Maintainer: Guoyi ZHang <myname at malacology dot net>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.3.7
pkgrel=2
pkgdesc="Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler"
arch=("i686" "x86_64")
url="https://github.com/bcgsc/abyss"
license=("GPL3")
depends=("openmpi" "make" "sqlite" "perl")
makedepends=("boost" "sparsehash" "btllib")
optdepends=(
  'pigz: for parallel gzip'
  'samtools: for reading SAM files'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcgsc/abyss/archive/$pkgver.tar.gz")
sha512sums=('71fe616724e61174d5034b91de9b0495b7c3d8cd2c3c88981048089003041bab6cad4ff608aac10bcb0846aaac047d73b9d6c2e1f52c0681ac351c5ef5a0831d')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --with-mpi=/usr/lib/openmpi --disable-werror
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
