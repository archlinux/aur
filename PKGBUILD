# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=sambamba
pkgver=0.8.1
pkgrel=2
pkgdesc="Tools for working with SAM/BAM data"
arch=('i686' 'x86_64')
url="http://lomereiter.github.io/sambamba"
license=('GPL2')
depends=(lz4 liblphobos)
makedepends=(ldc)
source=(https://github.com/biod/sambamba/archive/refs/tags/v${pkgver}.tar.gz
        make-lz4.patch
        pr-480.patch
)
sha256sums=(f432fdce3c51d333f2472c5fb1f84c87822a32639afe2b96434a13e7e7b7f7ef
            5b5c3f5bb8c65ef90e54a9c165afb27457311c361891115781c80f031f92d733
            dadb487cccb33ceb6f7fc0c14e2f0b342bdd22c226d6d1a4d06937c82358ea7f
           )

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/make-lz4.patch"
  patch --forward --strip=1 --input="${srcdir}/pr-480.patch"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "bin/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

}
