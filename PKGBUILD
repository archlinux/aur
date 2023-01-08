# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-class-c3'
pkgver='0.35'
pkgrel='1'
pkgdesc="A pragma to use the C3 method resolution order algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-algorithm-c3>=0.07' 'perl')
makedepends=()
url='https://metacpan.org/release/Class-C3'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Class-C3-${pkgver}.tar.gz")
sha512sums=('792dda26d6c77652ae0d1ca868284a798c631523d29f338d3b5bc771fd151a8529f6f8692a8fec7a9116ac8e40831b714bcfd205736c04e56e91fa39a4bae9a6')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Class-C3-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
