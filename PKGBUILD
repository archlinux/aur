# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_distname=Dist-Zilla-Plugin-InstallGuide
pkgname=perl-dist-zilla-plugin-installguide
pkgver=1.200014
pkgrel=1
pkgdesc="Build an INSTALL file"
arch=('any')
url="https://metacpan.org/release/$_distname"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.008'
         'perl-dist-zilla>=0'
         'perl-dist-zilla-role-modulemetadata>=0'
         'perl-moose>=0'
         'perl-path-tiny>=0'
         'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/$_distname-$pkgver.tar.gz")
md5sums=('b78f2a146da6fbed5699b8763f2f7565')

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
