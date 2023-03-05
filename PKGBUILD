# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-graph-readwrite
pkgver=2.10
pkgrel=1
pkgdesc="modules for reading and writing directed graphs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-graph' 'perl-parse-yapp' 'perl-xml-parser' 'perl-xml-writer')
url='https://metacpan.org/dist/Graph-ReadWrite'
_distdir="Graph-ReadWrite"
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB//$_distdir-$pkgver.tar.gz")
sha512sums=('f32e0fd002068ed53389d8903588cafb8ff819f01f7ef28c4d3fa9ffcb56e7eba1316583b7e91f2089b6a654cf896ffa96e3c29d89ab11b082856526044297e3')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir-$pkgver"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
