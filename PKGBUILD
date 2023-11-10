# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-test-distribution'
pkgver='2.00'
pkgrel='1'
pkgdesc="perform tests on all modules of a distribution"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule' 'perl-pod-coverage' 'perl-test-pod' 'perl-test-pod-coverage')
makedepends=('perl-module-build')
url='https://metacpan.org/dist/Test-Distribution'
source=('https://cpan.metacpan.org/authors/id/S/SR/SRSHAH/Test-Distribution-2.00.tar.gz')
md5sums=('7b7f905605f60a786f2ece2d76230fd1')
_distdir="Test-Distribution-2.00"

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
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
