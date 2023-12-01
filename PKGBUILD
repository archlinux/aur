# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-set-crontab
pkgver='1.03'
pkgrel='2'
pkgdesc="Expand crontab(5)-style integer lists"
arch=("any")
license=('GPL' 'PerlArtistic')
url="https://metacpan.org/pod/Set::Crontab"
options=(!emptydirs)
depends=('perl')
source=("https://cpan.metacpan.org/authors/id/A/AM/AMS/Set-Crontab-${pkgver}.tar.gz")
sha512sums=('9b4929691aac2f740ecf94cfdd166315c355a93be149ef76bbea06a8d820a9da2b7cf26dc6d66baea7f4b359c2012229376f06da55f3fe0653b6d0cc8c77ef91')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Set-Crontab-${pkgver}"
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
