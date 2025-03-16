# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=bsdiff
pkgver=4.3
pkgrel=2
pkgdesc="bsdiff and bspatch are tools for building and applying patches to binary files"
arch=(i686 x86_64)
url="https://www.daemonology.net/bsdiff/"
license=(LicenseRef-bsdiff)
depends=(bzip2 glibc)
makedepends=(patch)
source=("https://ftp.desolve.ru/pub/bsdiff/${pkgname}-${pkgver}.tar.gz"
        "CVE-2014-9862.patch"
        "LICENSE")
sha256sums=('18821588b2dc5bf159aa37d3bcb7b885d85ffd1e19f23a0c57a58723fea85f48'
            '3f50f832eff04a00d59bd7fe19fd743b5639ea7cc78822329a77604f28e24102'
            '796d7988e1258be8fa68fb3329b707d67ea50ab348036e97050462819d61b47e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np0 -i "${srcdir}/CVE-2014-9862.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cc ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -o bsdiff bsdiff.c -O3 -lbz2
  cc ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -o bspatch bspatch.c -O3 -lbz2
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bsdiff" "${pkgdir}/usr/bin/bsdiff"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bspatch" "${pkgdir}/usr/bin/bspatch"

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/bsdiff.1" "${pkgdir}/usr/share/man/man1/bsdiff.1"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/bspatch.1" "${pkgdir}/usr/share/man/man1/bspatch.1"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/bsdiff/LICENSE"
}
