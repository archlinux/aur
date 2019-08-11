# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.2.0
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

sha256sums=('315bad1b4e9038d6ebf45260e906f3bb3cecd99a0b845ec17996dd8846b4920b')
