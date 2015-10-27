# Contributor: maz-1

pkgname=perl-archive-rgssad
pkgver=0.11
pkgrel=1
pkgdesc="Provide an interface to RGSS (ruby game scripting system) archive files."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-io-string')
makedepends=()
url='http://search.cpan.org/~watashi/Archive-Rgssad-0.11/script/rgssad'
source=('http://search.cpan.org/CPAN/authors/id/W/WA/WATASHI/Archive-Rgssad-0.11.tar.gz')
md5sums=('4c3c9142dd7c66e290e476ce9dc5e8a5')
_distdir="Archive-Rgssad-0.11"

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
  ln -s /usr/bin/vendor_perl/rgssad "$pkgdir/usr/bin/rgssad"
}

