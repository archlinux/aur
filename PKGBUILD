# Maintainer: Guoyi ZHang <myname at malacology dot net>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.3.10
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
sha512sums=('7ba8f4e4be74d3ed9a0b6c08e188974b3298bd04a42a1ee706724b221a5bf32fa043ad564be5ded5ddabd4bc3a8412b5e103884bb8cb06f2e99d65fb8d2fba84')

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
