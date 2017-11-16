# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-clone-choose"
pkgver="0.008"
pkgrel="1"
pkgdesc="choose appropriate clone utility  "
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=("perl-module-runtime")
url="http://search.cpan.org/dist/Clone-Choose"
source=("http://search.cpan.org/CPAN/authors/id/H/HE/HERMES/Clone-Choose-${pkgver}.tar.gz")
sha512sums=('c3165f7698f9790fb1ee60c4fba543807d94e2184bf4d43e7db8b9a5fc6c0dae977231baae4faf9ecef3dd52133b129d10b0c6e9ff0672e5803270d2443ce319')

_prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Clone-Choose-${pkgver}"
}

build() {
  _prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  _prepare_environment
  make test
}

package() {
  _prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
