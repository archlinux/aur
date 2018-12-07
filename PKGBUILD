# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=abyss
pkgver=2.1.5
pkgrel=1
pkgdesc="Assembly By Short Sequences - a de novo, parallel, paired-end sequence assembler"
arch=("i686" "x86_64")
url="http://www.bcgsc.ca/platform/bioinfo/software/abyss"
license=("GPL3")
depends=("make" "openmpi" "sqlite")
makedepends=("boost" "sparsehash")
source=("http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/${pkgver}/abyss-${pkgver}.tar.gz")

build() {
  cd "${pkgname}-${pkgver}" 
  LDFLAGS="${LDFLAGS:-} -L/usr/lib/openmpi" ./configure --prefix=/usr
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

sha256sums=('65bfc8241e6ff5adf7601ae4ae93a75e3db86d6bff5d593c75aaff7f0ef41757')
