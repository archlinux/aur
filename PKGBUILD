# Maintainer: Scott Hamilton <sgn dot hamilton plus archlinux at protonmail dot com>

pkgname='perl-compress-raw-zlib'
pkgver='2.087'
pkgrel='1'
pkgdesc="Perl module Low-Level Interface to zlib compression library"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
url='https://metacpan.org/pod/Compress::Raw::Zlib'
source=('https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Zlib-2.087.tar.gz')
_distdir="Compress-Raw-Zlib-2.087"

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
md5sums=('8aab05dc31cddd81465f8ae342b96fad')
