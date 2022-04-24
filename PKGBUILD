# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-mixin-linewise'
pkgver='0.110'
pkgrel='1'
pkgdesc="write your linewise code for handles; this does the rest"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter' 'perl-perlio-utf8-strict')
url='https://metacpan.org/release/Mixin-Linewise'
source=('https://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Mixin-Linewise-0.110.tar.gz')
sha256sums=('a7f120b7aa82dfb1a5ad1aa11abd33232b26a2b09c654e649e97a3c2128b1d8b')
_distdir="Mixin-Linewise-0.110"

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
