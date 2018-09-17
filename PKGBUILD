# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sys-sigaction'
pkgver='0.23'
pkgrel='1'
pkgdesc="Perl extension for Consistent Signal Handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url="https://metacpan.org/pod/Sys::SigAction"
source=("https://cpan.metacpan.org/authors/id/L/LB/LBAXTER/Sys-SigAction-${pkgver}.tar.gz")
sha512sums=('04248c7b055efe15264a05677ab37a217828df518195308b3f46e5c415f8b1aef6578d1b79798ac38e4c9df7323f37ae10ce753189196edb75369bd6ec8ac309')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Sys-SigAction-${pkgver}"
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
