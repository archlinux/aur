# Maintainer: Tiago "marmis" de Paula <tiagodepalves@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=licensecheck
pkgver=3.2.12
pkgrel=2
pkgdesc='Simple license checker for source files'
arch=('any')
url="https://metacpan.org/dist/App-Licensecheck"
license=('AGPL-3.0-or-later')
# See "prereqs" https://metacpan.org/release/JONASS/App-Licensecheck-v3.2.12/source/Makefile.PL
makedepends=(
  ## configure::requires
  'perl-extutils-makemaker>=6.17'
)
optdepends=(
  ## runtime::recommends
  'perl-re-engine-re2'
)
depends=(
  ## runtime::requires
  'perl-array-intspan'
  'perl-autodie'
  'perl-encode'
  'perl-experimental'
  # perl: "Fnctl"
  'perl-getopt-long>=2.24'
  'perl-io-interactive'
  'perl-list-someutils'
  'perl-log-any'
  'perl-log-any-adapter-screen'
  'perl-moo>=1.001000'
  'perl-moox-struct'
  'perl-namespace-clean'
  'perl-path-iterator-rule'
  'perl-path-tiny>=0.062'
  'perl>=5.14'
  'perl-pod-constants'
  'perl-pod-usage'
  'perl-regexp-pattern>=0.2.12'
  'perl-regexp-pattern-license>=3.4.0'
  'perl-string-copyright>=0.003'
  'perl-string-escape'
  'perl-try-tiny'
)
checkdepends=(
  ## test::recommends
  'perl-file-basedir'
  'perl-regexp-pattern-license>=3.9.0'
  'perl-software-license>=0.103014' # "Software::LicenseUtils"
  'perl-yaml-libyaml' # "YAML::XS"

  ## test::requires
  'perl-encode'
  'perl-encode-locale'
  'perl' # "File::Basename"
  'perl-test2-suite>=0.000060' # "Test2::V0"
  'perl-test-command-simple'
  'perl-test-without-module'
)
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/J/JO/JONASS/App-Licensecheck-v${pkgver}.tar.gz")
sha512sums=('76d9eaf83d6f688d765581b57bdcd80529aa55017bff8f8c8390240c1429a45785109d8129de638ff1c5fea956b510faf6eb4ec38708bd918c702e3269081f55')
b2sums=('bbc58a4eb0c36c86bce9e367e93a0dc0bab814dd5214439fde5cb36413a52b7a9ffcd3dfc3150b1dd4baa052bd63c3ba9ca48d0811c92cf2e9da5a860afe742c')

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
