# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-latex-encode
pkgver='0.091.6'
pkgrel='1'
pkgdesc="Encode characters for LaTeX formatting"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/LaTeX-Encode/"
depends=('perl-html-parser' 'perl-readonly')
makedepends=('perl-carp-always')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/E/EI/EINHVERFR/LaTeX-Encode-${pkgver}.tar.gz)
md5sums=('7c8bc84f6e512a3f057b03f71793dcf0')
sha512sums=('a0d6bb32a72aba07256b86fee134795792e52e90ddafd344f8bdc4aba318ac35a2fa62e47ac4586956f78db79ed6382bf859fe5151cc1319ca5a92f5712fd9ea')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/LaTeX-Encode-${pkgver}"
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
