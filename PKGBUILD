# Maintainer: int <int [ate] arcor [dot] de>
# Contributer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-distribution'
pkgver='2.00'
pkgrel='1'
pkgdesc="Perl/CPAN Module Test::Distribution: perform tests on all modules of a distribution"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule>=0.03' 'perl-pod-coverage>=0.17' 'perl-test-pod>=0.95' 'perl-test-pod-coverage')
makedepends=('perl-module-build')
url='https://metacpan.org/dist/Test-Distribution'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRSHAH/Test-Distribution-${pkgver}.tar.gz")
md5sums=('7b7f905605f60a786f2ece2d76230fd1')
sha512sums=('74ad4bb228d6727f1c966e2b3311914de15ef6d191717b6c9e7fa7ab9286de737aefc889c1c3f1d587582f234e0da55e980cd7eabb7edce4bd13ff79f4333638')
_distdir="Test-Distribution-${pkgver}"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
