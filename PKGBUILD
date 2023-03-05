# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-test-mocktime-hires'
pkgver='0.08'
pkgrel='1'
pkgdesc="Replaces actual time with simulated high resolution time"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-mocktime')
checkdepends=('perl-test-class' 'perl-test-requires' 'perl-anyevent')
makedepends=('perl-module-build-tiny')
url='https://metacpan.org/dist/Test-MockTime-HiRes'
source=('https://cpan.metacpan.org/authors/id/T/TA/TARAO/Test-MockTime-HiRes-0.08.tar.gz')
md5sums=('ba664276b7540ed5f8f76fc68f5f75be')
_distdir="Test-MockTime-HiRes-0.08"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build 
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    unset DISPLAY
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

