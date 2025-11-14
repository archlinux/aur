# Maintainer: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=licensecheck
pkgver=3.3.9
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
  'perl-string-license'
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
options=(!emptydirs purge)
source=("https://cpan.metacpan.org/authors/id/J/JO/JONASS/App-Licensecheck-v${pkgver}.tar.gz")
b2sums=('1d589a4eedc0cc11907cb9c5358ca1703f5f63abfb380a968196c6eca93cd42f3b9c96ccfbfc10d649ae9a1e28240e23f39e344ecb79acb63bc56ef607267119')

build() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  export PERL_MM_USE_DEFAULT=1
  # test results ignored, but that's what Fedora does too:
  # https://src.fedoraproject.org/rpms/licensecheck/blob/main/f/licensecheck.spec
  LC_ALL=C.UTF-8 make test || :
}

package() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  make install DESTDIR="${pkgdir}"
}
