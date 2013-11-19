# Maintainer: Mark Grimes <mgrimes at peculier.com>
pkgname=perl-nagios-plugin
pkgver=0.36
pkgrel=1
pkgdesc="A family of perl modules to streamline writing Nagios plugins"
_dist=Nagios-Plugin
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('unknown')
depends=('perl>=5.10.0' 'perl-params-validate' 'perl-class-accessor' 'perl-config-tiny' 'perl-math-calc-units')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TONVOON/$_dist-$pkgver.tar.gz)
md5sums=('b897f6d5d66a655dde7caec579efcf2e')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# vim:set ts=2 sw=2 et:
