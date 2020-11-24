# Maintainer: em0lar <hello@em0lar.de>
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-IRIS
pkgname=perl-travel-status-de-iris
pkgver=1.52
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
sha256sums=('051fc891b82a992dfc2f8adfd09b4724a067fa4cf97a27f8edea1f8a88cbb389' 'bc333bc18657a42dbbe9ee1c0da8c6aee9775fd1fe93c77e25f158683d93509c')

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
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
