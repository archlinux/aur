# Contributor: Michael Gerdau <mgd@qata.de>

pkgname='perl-datetime-format-excel'
pkgver='0.31'
pkgrel='1'
pkgdesc="Perl extension to convert between DateTime and Excel dates"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime')
makedepends=()
url='http://search.cpan.org/dist/DateTime-Format-Excel'
source=('http://search.cpan.org/CPAN/authors/id/A/AB/ABURS/DateTime-Format-Excel-0.31.tar.gz')
md5sums=('37ba8d11c5a8dc5c5c5208f5d6c77f33')
sha512sums=('f9bb11b7a6a0a397ba5617625c031308819ba19efad37f6f275862a2f18e0e5ff07f39009821b1d70489fb4c45083f176dfbed130e9a202f9512ebfcf4c9c295')
_distdir="DateTime-Format-Excel-0.31"

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
