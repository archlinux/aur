# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-cam-pdf"
pkgver="1.60"
pkgrel='3'
pkgdesc="PDF manipulation library"
arch=('any')
url="http://search.cpan.org/dist/Algorithm-CheckDigits/"
license=('Artistic-2.0')
depends=('perl-crypt-rc4' 'perl-text-pdf')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/C/CD/CDOLAN/CAM-PDF-${pkgver}.tar.gz")
sha512sums=('75218c23f79f501b2fbaa2222598a1105c8729daaf4572f13949daf9bb46a983654cdd78f3434711b84b786d2ef36c5af5cfba4eae052537a11aa9857b665b79')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/CAM-PDF-${pkgver}"
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
