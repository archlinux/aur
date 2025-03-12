# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-event-cron
pkgver='0.09'
pkgrel='3'
pkgdesc="DateTime extension for generating recurrence sets from crontab lines and files"
arch=("any")
license=('Artistic-2.0')
url="https://metacpan.org/pod/DateTime::Event::Cron"
options=(!emptydirs)
depends=('perl-datetime' 'perl-datetime-set' 'perl-set-crontab')
source=("https://cpan.metacpan.org/authors/id/M/MS/MSISK/DateTime-Event-Cron-${pkgver}.tar.gz")
sha512sums=('c2614d57424ab11f9921dbe5e4c724a3977c0f57ea4ba4fa754087f369f465e8a723ab10843095310d6631da6ba48a98a38a715316b3e4b5cbff5030eb6f24d4')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/DateTime-Event-Cron-${pkgver}"
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
