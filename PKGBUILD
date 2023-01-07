# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-test-cpan-meta'
pkgver='0.25'
pkgrel='1'
pkgdesc="Validate your CPAN META.yml files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/pod/Test::CPAN::Meta'
source=("https://cpan.metacpan.org/authors/id/B/BA/BARBIE/Test-CPAN-Meta-${pkgver}.tar.gz")
sha512sums=('60a3414e1e0f9aaa1a9459aedd76a6d937742a4197d0d5ce9330348138997d372ca3f454c262fb6dd757699168aa7d1c2653c4066060c9c5685a6fe407260580')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Test-CPAN-Meta-${pkgver}"
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
