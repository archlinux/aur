# Maintainer: Flammkuchen <aur at bbirkner dot de>
# Contributor: web.de jan.stuehler
_author="Johan Vromans"
pkgname=perl-app-packager
pkgver=1.440
pkgrel=2
pkgdesc="Abstraction for Packagers"
arch=('any')
license=('unknown')
options=('!emptydirs')
depends=()
url='https://metacpan.org/release/App-Packager'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/App-Packager-${pkgver}.tar.gz")
sha512sums=('d228471b0a406503402ee0489433babf46d6d0735ad660e0e704ddf83b15faf6e449bfb028a0969a272c36b3137db2b74b1f0ed567a7c994524852ff2da32cf1')
_distdir="App-Packager-${pkgver}"

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
