# Maintainer: Bipin Kumar <bipin@ccmb.res.in>
# Previous Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=perl-file-share
pkgver=0.27
pkgrel=1
pkgdesc="Extend File::ShareDir to Local Libraries"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-sharedir' 'perl-readonly')
url='https://metacpan.org/release/File-Share'
source=(https://cpan.metacpan.org/authors/id/I/IN/INGY/File-Share-$pkgver.tar.gz)
sha512sums=('7c321de08e49f252e8e2126da00ea05ced13db362de758a693ee7f40452827fbf2591fb9e6c80caa27bb8767b3596893fc8762993a167583a0b40091e5db5ec7')
_distdir="File-Share-$pkgver"

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
