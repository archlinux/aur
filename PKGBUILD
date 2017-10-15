# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-class-uuidcolumns'
pkgver='0.02006'
pkgrel='1'
pkgdesc="Perl/CPAN Module DBIx::Class::UUIDColumns: Implicit uuid columns"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-grouped>=0' 'perl-dbix-class>=0.07005' 'perl>=5.8.1')
makedepends=('perl-dbd-sqlite>=1.11')
url='https://metacpan.org/release/DBIx-Class-UUIDColumns'
source=("http://search.cpan.org/CPAN/authors/id/A/AB/ABRAXXA/DBIx-Class-UUIDColumns-$pkgver.tar.gz")
md5sums=('801038335872df4e20f96a549dc361f0')
sha512sums=('9a4b74f2cadd345c0e7b1563099e8c0444d43c89b8f0dfb63f9e9d818df4b2cdddd57b23451edd5b8f145dd0c67f430da1d14cf10ff9ce95fc6a4128bf43c008')
_distdir="DBIx-Class-UUIDColumns-$pkgver"

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

prepare() {
  cd "$srcdir/$_distdir"

  # Patch Makefile.PL
  # by adding "use lib '.';" after "use warnings;".
  # Maybe a real patch-file would be better.
  #
  # This fixes the "Can't locate inc/Module/Install.pm in @INC"-error,
  # which isn't upstream yet, when doing "make".
  # See https://rt.cpan.org/Public/Bug/Display.html?id=120825
  # for details on this problem (but for a different Perl/CPAN-module).
  #
  sed -i "s/use warnings;/use warnings;\nuse lib '.';/" Makefile.PL
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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
