# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=1.9.0
pkgrel=1
pkgdesc="Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler"
arch=("i686" "x86_64")
url="http://www.bcgsc.ca/platform/bioinfo/software/abyss"
license=("custom")
depends=("openmpi" "boost-libs")
makedepends=("boost" "sparsehash")
source=("https://github.com/bcgsc/abyss/releases/download/1.9.0/abyss-1.9.0.tar.gz")

build() {
  cd "${pkgname}-${pkgver}" 
  LDFLAGS=-L/usr/lib/openmpi ./configure --prefix=/usr
  make 
}

check() {
  cd "${pkgname}-${pkgver}" 
  make check
}

package() {
  cd "${pkgname}-${pkgver}" 
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

sha1sums=('7ae0f00e2205a4cdc75a92925176e5f343cb09ca')
