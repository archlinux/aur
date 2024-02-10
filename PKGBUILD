# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-clone-choose"
pkgver="0.010"
pkgrel="2"
pkgdesc="choose appropriate clone utility"
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=('perl')
checkdepends=('perl-test-without-module' 'perl-clone' 'perl-clone-pp')
optdepends=('perl-clone')
url="https://metacpan.org/dist/Clone-Choose"
source=("https://cpan.metacpan.org/authors/id/H/HE/HERMES/Clone-Choose-${pkgver}.tar.gz")
sha512sums=('5dbcd1b031ddbdaff81c46c5a48eb51b31bfe451e0777dc88a107d2b104e8708f08a5717a0f82f4d03efb8610e2b42fcb2dc1269e3262ece16b9a503d606face')

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
