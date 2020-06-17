# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.2.4
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

sha256sums=('f064a8c5ad152a37963d9001df6c89d744370f7ec5a387307747c4647360a47c')
