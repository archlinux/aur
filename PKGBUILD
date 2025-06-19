# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-carp-object'
pkgver='1.02'
pkgrel='1'
pkgdesc="a replacement for Carp or Carp::Clan, object-oriented"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=(
  'perl-clone'
  'perl-devel-stacktrace'
)
url='https://metacpan.org/pod/Carp::Object'
source=("https://cpan.metacpan.org/authors/id/D/DA/DAMI/Carp-Object-${pkgver}.tar.gz")
sha512sums=('2ca7f1769ecca8ca7244ba17f670f50cbf403ebbe9328e33ccdc48335898ebb5afcaf69c5eac991f218ade8c34818d868dd93b395e812b471059c2e481b90b0f')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Carp-Object-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  prepare_environment
  ./Build test
}

package() {
  prepare_environment
  ./Build install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
