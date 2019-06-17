# maintainer: web.de jan.stuehler
_author="Johan Vromans"
pkgname=perl-file-loadlines
pkgver=0.02
pkgrel=1
pkgdesc="load the contents of a text file into an array of lines"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=()
url='https://metacpan.org/release/File-LoadLines'
source=('https://cpan.metacpan.org/authors/id/J/JV/JV/File-LoadLines-0.02.tar.gz')
sha512sums=('be7c567b4bba99f4aa12601d6dd0dc60956eac661f956ab9a820272148e477c7c24dfbbcdeff4e816492bcdcf9650077dbe309205aa21e802aa1dcc00f2ff5d1')
_distdir="File-LoadLines-0.02"

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
