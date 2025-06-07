# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: John D Jones III <jnbek1972@gmail.com>

pkgname=perl-string-escape
pkgver=2010.002
pkgrel=1
pkgdesc='Backslash escapes, quoted phrase, word elision, etc.'
arch=('any')
url="https://metacpan.org/dist/String-Escape"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
# See https://metacpan.org/dist/String-Escape/source/Makefile.PL
makedepends=('perl-extutils-makemaker>=6.3002')
checkdepends=(
  'perl-test-simple' # "Test::More"
)
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/E/EV/EVO/String-Escape-${pkgver}.tar.gz")
sha512sums=('668e196bbd95b4e9e5fc9ae3aebe0e7f1990362973bd027f2f3728f212786bc2104141ced3e024006b3ed22fa6345b968440029c98b87cbc299ac192221724c7')
b2sums=('d012323bdf10b9c8e47c90dfe1bbb064e09c7a0b00c469d9285d8a9a7ad1ee80b1d30b1fff1d5218d4491a36780174526273775dac790db2f22c0a22cc01fb14')

build() {
  cd "${srcdir}/String-Escape-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/String-Escape-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/String-Escape-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="${pkgdir}"
}
