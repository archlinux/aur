# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-eval-linenumbers'
pkgver='0.35'
pkgrel='2'
pkgdesc="Add line numbers to hereis blocks that contain perl source code"
arch=('any')
url="http://search.cpan.org/dist/Eval-LineNumbers"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
depends=('perl')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/Eval-LineNumbers-${pkgver}.tar.gz")
md5sums=('3aa767153567825f57bee4a0f3070d00')
sha512sums=('2128e30c3a36b282ba223d13b73effc189394a4827c83edb11fda9e5ca58c24f226df59df93dc0ed465ae9b3370fc4ad418c9cdc0f8df58fac0a89c93053f747')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Eval-LineNumbers-${pkgver}"
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
