# Contributor: Vlad <avireti@gmail.com>

pkgname=perl-convert-bencode-xs
pkgver=0.06
pkgrel=1
pkgdesc="Faster conversions to/from Bencode format"
url="http://search.cpan.org/dist/Convert-Bencode_XS"
license=('PerlArtistic' 'GPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('perl<=5.17.9')
source=("http://search.cpan.org/CPAN/authors/id/I/IW/IWADE/Convert-Bencode_XS-$pkgver.tar.gz")
sha256sums=('3b7aa07abefce56ea2416f8f7f20afcc95d7003e326f4173bc9874f125d75b6d')
_distdir="Convert-Bencode_XS-0.06"

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
