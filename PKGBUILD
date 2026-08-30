# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=perl-string-license
pkgdesc='Detect source code license statements in a text string'
pkgver=0.1.0
pkgrel=1
url='https://metacpan.org/dist/String-License'
arch=(any)
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
  'perl>=5.40'
  'perl-regexp-pattern>=0.2.12'
  'perl-regexp-pattern-license>=3.4.0'
)
checkdepends=(
  ## test::recommends
  'perl-file-basedir'
  'perl-regexp-pattern-license>=3.11.3'
  'perl-software-license>=0.104006' # "Software::LicenseUtils"
  'perl-yaml-libyaml' # "YAML::XS"

  ## test::requires
  'perl-test-simple>=1.302200' # "Test2::V0"
  'perl-test-without-module'

  # undeclared
  'perl-re-engine-re2'
)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/J/JO/JONASS/String-License-v${pkgver}.tar.gz")
b2sums=('28a934f75f31069ffb59a129b09d4162a267ca07fdd5d8e8c3c73990571699a3e3300e3584dbe4cd8868302b52f95daf47134c811ed44038be1ff27da0d2416f')

build() {
  cd "String-License-v${pkgver}"

  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "String-License-v${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "String-License-v${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
