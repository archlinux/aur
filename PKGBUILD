# Maintainer: Mark Grimes <mgrimes at peculier dot com>

pkgname=perl-datetime-format-datemanip
_realname=DateTime-Format-DateManip
pkgver=0.04
pkgrel=2
pkgdesc="Perl DateTime extension to convert Date::Manip dates and durations to DateTimes and vice versa."
url="https://metacpan.org/module/DateTime::Format::DateManip"
depends=(perl perl-datetime perl-date-manip)
license="GPL"
options=('!emptydirs')
arch=('i686' 'x86_64')
source=(http://cpan.metacpan.org/authors/id/B/BB/BBENNETT/dt-fmt-datemanip/DateTime-Format-DateManip-0.04.tar.gz)
md5sums=('5965a3b4760c8aafb7471ba37d3a39c4')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"

  # Set env variables to overwrite any existing options we don't want and
  # specify the vendor destination
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
  PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
  PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
  PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
  MODULEBUILDRC=/dev/null

  # If using Build.PL
  { /usr/bin/perl Build.PL &&
  ./Build &&
  # ./Build test &&
  ./Build install; } || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
