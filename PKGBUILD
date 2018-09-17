# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-test-synopsis'
pkgver='0.15'
pkgrel='1'
pkgdesc="Test your SYNOPSIS code"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Test-Synopsis'
source=("https://cpan.metacpan.org/authors/id/Z/ZO/ZOFFIX/Test-Synopsis-${pkgver}.tar.gz")
sha512sums=('5efd04a168265d804b2afe027e14227cb977cf41cb59ae05f272e89488249acc64f6fdff7da66b74213cba024e811f3e3f8fb76013cc65d9fbfdc35c9440d62c')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Test-Synopsis-${pkgver}"
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
