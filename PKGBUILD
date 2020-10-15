# Maintainer: em0lar <hello@em0lar.de>
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-IRIS
pkgname=perl-travel-status-de-iris
pkgver=1.49
pkgrel=1
pkgdesc='Interface to IRIS-based web departure monitors (as used by DeutscheBahn)'
url='http://finalrewind.org/projects/Travel-Status-DE-IRIS/'
license=('PerlArtistic')
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-datetime'
  'perl-datetime-format-strptime'
  'perl-geo-distance'
  'perl-lwp-protocol-https'
  'perl-list-compare'
  'perl-list-moreutils'
  'perl-list-utilsby'
  'perl-text-levenshtein'
  'perl-xml-libxml'
)
makedepends=(
  'perl-module-build'
  'perl-file-slurp'
  'perl-json'
  'perl-test-compile'
  'perl-test-fatal'
  'perl-test-pod'
  'perl-text-csv'
  'perl-test-number-delta'
  'perl-cache'
)
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')  # Daniel Friesel
source=("https://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
md5sums=('c0f6f7f4c5fc043f433d61591676c886' '1165eaaec5b9dc6b2559220ddf081a89')

build() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  sed -i 's/Text::LevenshteinXS/Text::Levenshtein/' Build.PL lib/Travel/Status/DE/IRIS/Stations.pm
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  ./Build
}

check() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build test
}

package() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build install
}
