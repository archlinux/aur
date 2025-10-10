# Maintainer: Tiago "marmis" de Paula <tiagodepalves@gmail.com>
# Contributor: Tiago "marmis" de Paula <tiagodepalves@gmail.com>

pkgname=perl-string-license
pkgver=0.0.11
pkgrel=1
pkgdesc='Detect source code license statements in a text string'
arch=('any')
url='https://metacpan.org/dist/String-License'
license=('AGPL-3.0-or-later')
# See "prereqs" in https://metacpan.org/dist/String-License/source/Makefile.PL
makedepends=(
  ## configure::requires
  'perl-extutils-makemaker>=6.17'
)
optdepends=(
  ## runtime::recommends
  'perl-re-engine-re2: enable additional detections'
)
depends=(
  ## runtime::requires
  'perl-array-intspan'
  'perl-feature-compat-class>=0.07'
  'perl-scalar-list-utils>=1.45' # "List::Util"
  'perl-log-any'
  'perl-namespace-clean'
  'perl-path-tiny>=0.062'
  'perl>=5.20'
  'perl-regexp-pattern>=0.2.12'
  'perl-regexp-pattern-license>=3.4.0'
)
checkdepends=(
  ## test::recommends
  'perl-file-basedir'
  'perl-regexp-pattern-license>=3.9.0'
  'perl-software-license>=0.104006' # "Software::LicenseUtils"
  'perl-yaml-libyaml' # "YAML::XS"

  ## test::requires
  'perl-test-simple>=1.302200' # "Test2::V0"
  'perl-test-without-module'
)
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/J/JO/JONASS/String-License-v${pkgver}.tar.gz")
b2sums=('733af1f8edfc3ba402f475ada43435ec698b0f227543927efcd0dbeff10401869da418b8770e517d3380509e3ac8f27892ac4c1269df33b8420d8445c87cc2ce')

build() {
  cd "${srcdir}/String-License-v${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/String-License-v${pkgver}"

  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/String-License-v${pkgver}"

  make install DESTDIR="${pkgdir}"
}
