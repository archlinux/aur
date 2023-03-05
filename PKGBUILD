# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-alien-gnuplot
pkgver=1.040
pkgrel=1
pkgdesc="Find and verify functionality of the gnuplot executable."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'gnuplot')
makedepends=('perl-alien-build')
checkdepends=('perl-test-exception')
url='https://metacpan.org/dist/Alien-Gnuplot'
_distdir="Alien-Gnuplot"
source=("https://cpan.metacpan.org/authors/id/Z/ZM/ZMUGHAL/$_distdir-$pkgver.tar.gz")
sha512sums=('b8665ffba818026c569c5a9b6a632aed473c69d0f0eef3a81d20ced008036b230ca1a8fb4c94fa7bd95b10de91e8b2c11777c26b6a4997068353ee2856ec6712')

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
