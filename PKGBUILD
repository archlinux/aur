# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-lwp-useragent-cached'
pkgver='0.08'
pkgrel='2'
pkgdesc="LWP::UserAgent with simple caching mechanism"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
url='https://metacpan.org/release/LWP-UserAgent-Cached'
source=("https://cpan.metacpan.org/authors/id/O/OL/OLEG/LWP-UserAgent-Cached-${pkgver}.tar.gz")
sha512sums=('5c1c18d3a54257aac6f266298d63c4cec9e6c6cbdfe6470cbf02676fc327a9c71238158b08036852c4971787fd8b7b67b85eaa4016687bc6c815a68037e15c47')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/LWP-UserAgent-Cached-${pkgver}"
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
