pkgname=perl-file-share
pkgver=0.25
pkgrel=2
pkgdesc="Extend File::ShareDir to Local Libraries"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-sharedir>=1.03')
url='https://metacpan.org/release/File-Share'
source=('http://search.cpan.org/CPAN/authors/id/I/IN/INGY/File-Share-0.25.tar.gz')
sha512sums=('7c9f9a341a5d2d397479a09da05136df1d0c6b9869da511e45ee75b49565218f2231fd1b45c61e68ab802402a95af02513c4c78ce72cf8205537d0e68f9b1e46')
_distdir="File-Share-0.25"

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
