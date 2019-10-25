# Maintainer: Scott Hamilton <sgn dot hamilton plus archlinux at protonmail dot com>

pkgname='perl-scalar-util'
pkgver='1.53'
pkgrel='1'
pkgdesc="Perl module which implements a selection of general-utility scalar subroutines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-test-more-git')
makedepends=()
url='https://metacpan.org/pod/Scalar::Util'
source=('https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Scalar-List-Utils-1.53.tar.gz')
_distdir="Scalar-List-Utils-1.53"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null
    echo "pwd : $pwd"
    echo "path is '$srcdir/$_distdir'"
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
md5sums=('901d8cd8859b9b9a56002df1023e94ea')
