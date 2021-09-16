# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=licensecheck
pkgver=3.2.12
pkgrel=1
pkgdesc="Simple license checker for source files"
arch=('any')
url="https://salsa.debian.org/build-common-team/licensecheck"
license=('AGPL3')
depends=('perl' 'perl-array-intspan' 'perl-io-interactive' 'perl-list-someutils'
         'perl-log-any' 'perl-log-any-adapter-screen' 'perl-moo'
         'perl-moox-struct' 'perl-path-iterator-rule' 'perl-path-tiny'
         'perl-pod-constants' 'perl-regexp-pattern'
         'perl-regexp-pattern-license' 'perl-string-copyright'
         'perl-string-escape' 'perl-try-tiny' 'perl-namespace-clean')
checkdepends=('perl-encode-locale' 'perl-test2-suite' 'perl-test-command-simple'
              'perl-test-without-module')
optdepends=('perl-re-engine-re2')
source=("https://www.cpan.org/modules/by-module/App/App-Licensecheck-v${pkgver}.tar.gz")
sha512sums=('76d9eaf83d6f688d765581b57bdcd80529aa55017bff8f8c8390240c1429a45785109d8129de638ff1c5fea956b510faf6eb4ec38708bd918c702e3269081f55')

build() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  make test
}

package() {
  cd "${srcdir}/App-Licensecheck-v${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
