# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-apachebench'
pkgver='0.73'
pkgrel='1'
pkgdesc="Perl/CPAN Module HTTPD::Bench::ApacheBench: Perl API for Apache benchmarking and regression testing."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-net-http')
makedepends=()
url='https://metacpan.org/release/ApacheBench'
source=("http://search.cpan.org/CPAN/authors/id/A/AD/ADIRAJ/ApacheBench-$pkgver.tar.gz")
md5sums=('96fd85c2b90f59da0fcaa8c5ac4117b9')
sha512sums=('2033e377124fe1265133ccb4e00ddc11867c2b42f1927dc9f9c652dd7d22bf8ff39b72d0233eb65dd8e9698b9d9a4461699349b2577aa3c2ab5370bfbf0ca5c5')
_distdir="ApacheBench-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
