# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: John D Jones III <jnbek1972@gmail.com>

pkgname=perl-string-escape
pkgdesc='Backslash escapes, quoted phrase, word elision, etc'
pkgver=2010.002
pkgrel=3
url='https://metacpan.org/dist/String-Escape'
arch=(any)
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
# See https://metacpan.org/dist/String-Escape/source/Makefile.PL
makedepends=('perl-extutils-makemaker>=6.3002')
checkdepends=(
  'perl-test-simple' # "Test::More"
)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/E/EV/EVO/String-Escape-${pkgver}.tar.gz"
        'https://sources.debian.org/data/main/libs/libstring-escape-perl/2010.002-3/debian/patches/backslash.patch')
b2sums=('d012323bdf10b9c8e47c90dfe1bbb064e09c7a0b00c469d9285d8a9a7ad1ee80b1d30b1fff1d5218d4491a36780174526273775dac790db2f22c0a22cc01fb14'
        'ec04c8d074159fbf7b8f0bb79c674ccec6b270a3804b80eabebcc5f6bbcee3ce526aef281ac0da85bc7babdae412e36210b5321c4ebc47123ad7f211a4c8e2a4')

prepare() {
  cd "String-Escape-${pkgver}"

  # Description: escape a double quote in a regexp
  patch -p1 -i "${srcdir}/backslash.patch"
}

build() {
  cd "String-Escape-${pkgver}"

  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "String-Escape-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "String-Escape-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
