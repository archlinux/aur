# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: John D Jones III <jnbek1972@gmail.com>

pkgname=perl-string-escape
pkgver=2010.002
pkgrel=2
pkgdesc='Backslash escapes, quoted phrase, word elision, etc.'
arch=('any')
url='https://metacpan.org/dist/String-Escape'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
# See https://metacpan.org/dist/String-Escape/source/Makefile.PL
makedepends=('perl-extutils-makemaker>=6.3002')
checkdepends=(
  'perl-test-simple' # "Test::More"
)
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/E/EV/EVO/String-Escape-${pkgver}.tar.gz"
        '0001-backslash.patch')
b2sums=('d012323bdf10b9c8e47c90dfe1bbb064e09c7a0b00c469d9285d8a9a7ad1ee80b1d30b1fff1d5218d4491a36780174526273775dac790db2f22c0a22cc01fb14'
        'ec04c8d074159fbf7b8f0bb79c674ccec6b270a3804b80eabebcc5f6bbcee3ce526aef281ac0da85bc7babdae412e36210b5321c4ebc47123ad7f211a4c8e2a4')

prepare() {
  cd "${srcdir}/String-Escape-${pkgver}"

  # From https://sources.debian.org/patches/libstring-escape-perl/2010.002-3/backslash.patch/
  patch -p1 -i "${srcdir}/0001-backslash.patch"
}

build() {
  cd "${srcdir}/String-Escape-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/String-Escape-${pkgver}"

  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/String-Escape-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
