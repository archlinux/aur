# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=perl-compress-bgzf
pkgver=0.005
pkgrel=1
pkgdesc="Read/write blocked GZIP (BGZF) files"
arch=('any')
url='https://metacpan.org/pod/Compress::BGZF'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.012')
makedepends=()
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/V/VO/VOLKENING/Compress-BGZF-0.005.tar.gz')
md5sums=('1ed412dc27cc43bd2aa6750c220b9fca')
_distdir="Compress-BGZF-$pkgver"

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
