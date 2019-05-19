# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
_distname=Dist-Zilla-Role-ModuleMetadata
pkgname=perl-dist-zilla-role-modulemetadata
pkgver=0.006
pkgrel=1
pkgdesc="A role for plugins that use Module::Metadata"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl>=5.010'
         'perl-dist-zilla>=0'
         'perl-moose>=0'
         'perl-path-tiny>=0'
         'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-needs>=0')
options=('!emptydirs')
url="https://metacpan.org/release/$_distname"
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/$_distname-$pkgver.tar.gz")
md5sums=('e4a470bd449da77710211bf597a16c1e')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distname-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
