# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO: manpages?

pkgname='libcs50'
pkgver=8.1.0
pkgrel=1
pkgdesc="Harvard's cs50 C library"
arch=('i686' 'x86_64')
url='https://cs50.harvard.edu/'
license=('unknown')
groups=('cs50')
makedepends=('asciidoctor')
conflicts=('libcs50')
provides=('libcs50')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/cs50/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'f48b6e7e152df523cb0812874ed64a68d9f0f665a609a6601462bde226f66cd4'
)

_query_jobs() {
  echo "${MAKEFLAGS}" \
    | grep -Eo "\-j.?[0-9]+"
}

_set_jobs() {
  echo $MAKEFLAGS \
    | sed "s/$(_query_jobs)/-j 1/"
}

build() {
  cd "${pkgname}-${pkgver}"
  
  # Override makeflags:
  local MAKEFLAGS=$(_set_jobs)

  make
}

package() {
  cd "${pkgname}-${pkgver}"

 install -d "${pkgdir}/usr"
 install -d "${pkgdir}/usr/share/man/man3"
 cp -rp build/* "${pkgdir}/usr/"
 cp -rp debian/docs/* "${pkgdir}/usr/share/man/man3/"
}

# vim: ts=2 sw=2 et:
