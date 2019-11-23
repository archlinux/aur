# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.2.3
pkgrel=1
pkgdesc="Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler"
arch=("i686" "x86_64")
url="http://www.bcgsc.ca/platform/bioinfo/software/abyss"
license=("GPL3")
depends=("make" "openmpi" "sqlite")
makedepends=("boost" "sparsehash")
source=("https://github.com/bcgsc/abyss/releases/download/$pkgver/abyss-$pkgver.tar.gz")

build() {
  cd "${pkgname}-${pkgver}" 
  LDFLAGS="${LDFLAGS:-} -L/usr/lib/openmpi" \
	  ./configure --prefix=/usr --disable-werror
  make 
}

check() {
  cd "${pkgname}-${pkgver}" 
  make check
}

package() {
  cd "${pkgname}-${pkgver}" 
  make DESTDIR="${pkgdir}" install
}

sha256sums=('ac7679ececbdd89cc050998eae31fa5f8bf7cdab6a0c05eb5eb1e3867c7e75cb')
