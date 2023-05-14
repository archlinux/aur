# Maintainer: Guoyi ZHang <myname at malacology dot net>
# Contributor: PolpOnline <aur at t0mmy dot anonaddy dot com>
# Contributor:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.3.6
pkgrel=1
pkgdesc="Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler"
arch=("i686" "x86_64")
url="https://github.com/bcgsc/abyss"
license=("GPL3")
depends=("openmpi" "make")
makedepends=("boost" "sparsehash" "make" "btllib")
optdepends=(
  'pigz: for parallel gzip'
  'samtools: for reading SAM files'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcgsc/abyss/archive/$pkgver.tar.gz")
sha512sums=('bc535f2676f6ed9929219680fb301787bffa527892c46f96c10d4e998cd7a7cf88df689f04e3bb4333d4a8ec7f098f6bd45b1a0e20877674d003c7f57eca5268')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --with-boost=/usr/lib --with-mpi=/usr/lib/openmpi --with-sparsehash=/usr/lib --with-btllib=/usr/lib --without-sqlite --disable-werror
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


