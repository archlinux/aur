# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-jenkins-api
pkgver=0.18
pkgrel=2
pkgdesc='A wrapper around the Jenkins API'
arch=('any')
url='https://metacpan.org/pod/Jenkins::API'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
# See https://metacpan.org/dist/Jenkins-API/source/Makefile.PL
makedepends=(
  ## BUILD_REQUIRES
  'perl-pod-coverage-trustpod'
  'perl-test-simple>=1.302200' # "Test2::Suite"
  'perl-test2-tools-explain'
  'perl-test-pod-coverage'

  ## CONFIGURE_REQUIRES
  'perl-extutils-makemaker'
)
depends=(
  ## PREREQ_PM
  'perl-file-sharedir'
  'perl-json'
  'perl-mime-base64'
  'perl-moo'
  'perl-rest-client'
  'perl-type-tiny' # "Types::Standard"
  'perl-uri'
)
checkdepends=(
  ## TEST_REQUIRES
  'perl-extutils-makemaker'
  'perl-test2-tools-explain'
)
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/N/NE/NEWELLC/Jenkins-API-${pkgver}.tar.gz")
b2sums=('5bce66540502f57167b038c178135dbb8a3bf11b206c46a8855cd37cdf74448e58db18369dafb0de668cefd224818441412fa2b9f8cbb2548f6bff75f6202a7a')

build() {
  cd "${srcdir}/Jenkins-API-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/Jenkins-API-${pkgver}"

  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/Jenkins-API-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
