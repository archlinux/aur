# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-format-mysql
pkgver='0.05'
pkgrel='2'
pkgdesc="Parse and format MySQL dates and times"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~drolsky/DateTime-Format-MySQL"
options=(!emptydirs)
depends=('perl-datetime' 'perl-datetime-format-builder')
source=("https://cpan.metacpan.org/authors/id/X/XM/XMIKEW/DateTime-Format-MySQL-${pkgver}.tar.gz")
md5sums=('22c3be681f96796dc7ffc381b14ccb23')
sha512sums=('1948f5aa11d210e9d2a832ca99578c4b2b9357de35eb6a460c820ab86a8216c9b44cb7472f7152462e75a17234d6dc5ee1aaa878b1c8fc88ba81c05fd6e1c140')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/DateTime-Format-MySQL-${pkgver}"
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
