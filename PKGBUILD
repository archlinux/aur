# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-pod-projectdocs'
pkgver='0.42'
pkgrel='1'
pkgdesc="generates CPAN like pod pages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-class-data-inheritable>=0' 'perl-json>=2.04' 'perl-readonly>=0' 'perl-template-toolkit>=0' 'perl-uri>=0')
makedepends=()
url='https://metacpan.org/release/Pod-ProjectDocs'
source=('http://search.cpan.org/CPAN/authors/id/M/MG/MGRUNER/Pod-ProjectDocs-0.42.tar.gz')
md5sums=('734ebac24108ca7a91d68476bd3e10e2')
sha512sums=('79641f3c40aa5068d9a804d946ee3a511a7e63e03d3dc5261465d7125de2e23144990acb8659ccefbd55e31ab466194ee2ba45be2efc22ffe2b07b72e200abfc')
_distdir="Pod-ProjectDocs-0.42"

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
