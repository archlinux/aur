# Maintainer: Guoyi ZHang <myname at malacology dot net>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.3.9
pkgrel=1
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
sha512sums=('0b2e808b6dcbd5d5bcc12aa23fe1d47a6f10b95c90ecbd61e2438e5fa69f488c326c8874e305c75dd1b4e2e632fcfa68eb259894b17a0db65ec4b5eba0440171')

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
