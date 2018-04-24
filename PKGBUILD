# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-file-extattr
pkgver='1.09'
pkgrel='1'
pkgdesc="Perl extension for accessing extended attributes of files"
arch=('any')
url="http://search.cpan.org/dist/File-ExtAttr"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RI/RICHDAWE/File-ExtAttr-${pkgver}.tar.gz")
sha512sums=('eca00420bef313ac711bf1d64323e051acc8eb77ab8e267067f586e78dc42d43f685fe571c7856186c998e939dd2761d24650c61297c24486bc005dddf6b4bb3')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/File-ExtAttr-${pkgver}"
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
