# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=licensecheck
pkgver=3.3.10
pkgrel=1
pkgdesc='Simple license checker for source files'
arch=('any')
url="https://metacpan.org/dist/App-Licensecheck"
license=('AGPL-3.0-or-later')
# See "prereqs" in https://metacpan.org/dist/App-Licensecheck/source/Makefile.PL
makedepends=(
  ## configure::requires
  'perl-extutils-makemaker>=6.17'
)
depends=(
  ## runtime::requires
  'perl-autodie'
  'perl-encode>=2.93'
  # perl: "Fnctl"
  'perl-feature-compat-class>=0.04'
  'perl-feature-compat-try'
  'perl-getopt-long>=2.24'
  'perl-io-interactive'
  'perl-scalar-list-utils>=1.45' # "List::Util"
  'perl-log-any'
  'perl-log-any-adapter-screen'
  'perl-namespace-clean'
  'perl-path-iterator-rule'
  'perl-path-tiny>=0.062'
  'perl>=5.12'
  'perl-pod-constants'
  'perl-pod-usage>=1.60'
  'perl-string-copyright>=0.003'
  'perl-string-escape'
  'perl-string-license>=0.0.6'
)
checkdepends=(
  ## test::recommends
  'perl-regexp-pattern-license>=3.9.0'
  'perl-string-copyright>=0.003009'

  ## test::requires
  'perl-encode'
  'perl-encode-locale'
  'perl-test2-tools-command'
  'perl-test-simple>=1.302200' # "Test2::V0"
  'perl-test-without-module'
)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/J/JO/JONASS/App-Licensecheck-v${pkgver}.tar.gz")
b2sums=('114f192f2c01e50b235df32fce33647d39765d4bc7f9f3993715a0f9a29112efc1cb3d190351f73c388a3069f4e9d06b82ef5306dde547890776c67e4309dd0c')

build() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  LC_ALL=C.UTF-8 make test
}

package() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
