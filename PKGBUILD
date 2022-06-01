# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='perl-regexp-assemble'
pkgver='0.38'
pkgrel='3'
pkgdesc="Assemble multiple Regular Expressions into a single RE"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/release/Regexp-Assemble'
source=("https://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Regexp-Assemble-${pkgver}.tgz")
md5sums=('75905c73b33c123ce085fd7d194dd95e')
sha512sums=('65f4fefe2ad93bda1a9a367bfd660702ad3fbdef122d4272766afa96b863b7a85850be3261162a9362dba01af8dfc055435f6b125b3268c4f48d46cfc9664ef7')
_distdir="Regexp-Assemble-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
