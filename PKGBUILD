# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-mail-mbox-messageparser
_dist=Mail-Mbox-MessageParser
pkgver=1.5111
pkgrel=2
pkgdesc='A fast and simple mbox folder reader'
arch=(any)
license=(GPL-2.0-only)
options=(!emptydirs)
depends=(perl-filehandle-unget)
checkdepends=(perl-test-compile perl-text-diff perl-test-pod perl-test-pod-coverage perl-universal-require)
url='http://search.cpan.org/dist/Mail-Mbox-MessageParser'
source=("$pkgname-$pkgver.tar.gz::http://search.cpan.org/CPAN/authors/id/D/DC/DCOPPIT/Mail-Mbox-MessageParser-$pkgver.tar.gz")
b2sums=('d5c4e2974a3336088fcb69233c45972246972eb4f88c17b5d0fd205e300c8773c7e6cc6b401ca895c045f59c86c048f473cd2c5f46ff890f556db10965cc2f8b')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
