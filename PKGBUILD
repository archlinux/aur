# maintainer: web.de jan.stuehler
_author="Johan Vromans"
pkgname=perl-text-layout
pkgver=0.014.1
pkgrel=1
pkgdesc="Pango style markup formatting"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=()
url='https://metacpan.org/pod/Text::Layout'
source=('https://cpan.metacpan.org/authors/id/J/JV/JV/Text-Layout-0.014.1.tar.gz')
sha512sums=('19dc7407df4b6d41c20360cb8c1ab1f5fcf7338201cc3bd371f11675736d3884cf2e05d9d6cf77086a20c7751b676414829dc734f54e0e7959cde3b525524301')
_distdir="Text-Layout-0.014.1"

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
