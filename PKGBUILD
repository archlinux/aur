# Contributor: John D Jones III <jnbek1972@gmail.com>
# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname='perl-html-mason'
pkgver='1.51'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cache-cache>=1.00' 'perl-class-container>=0.07' 'perl-exception-class>=1.15' 'perl-html-parser' 'perl-log-any>=0.08' 'perl-params-validate>=0.70')
makedepends=('perl-test-deep')
url='http://search.cpan.org/dist/HTML-Mason'
source=('http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/HTML-Mason-1.51.tar.gz')
sha512sums=('c585f1fedfef4ecdd5a366f79687fe61f1942374a6acc2ca7f8238819b0e43617524b273f173ac52d7037d6459ce11c2bca5f36015c0f245a063653446b614c2')
_distdir="HTML-Mason-1.51"

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

