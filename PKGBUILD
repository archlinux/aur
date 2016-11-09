# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-graphics-gnuplotif'
pkgver='1.8'
pkgrel='1'
pkgdesc="A dynamic Perl interface to gnuplot"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'gnuplot')
makedepends=()
url='https://metacpan.org/release/Graphics-GnuplotIF'
source=('http://search.cpan.org/CPAN/authors/id/M/ME/MEHNER/Graphics-GnuplotIF-1.8.tar.gz')
md5sums=('c5416c5db2bb10a171e60c98e6427e84')
sha512sums=('c0eb2d39d38a891b69969448a1e9be4184c4ea045c1eee813f6c7293d8c3c23d044e1e90c0834fcc76b7f84d388706e0f58bbee044dc9b5d6e4b5cc523a61ea6')
_distdir="Graphics-GnuplotIF-1.8"

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
