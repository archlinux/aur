# Maintainer: Mark Grimes <mgrimes at peculier.com>

pkgname=perl-monitoring-plugin
pkgver=0.40
pkgrel=2
pkgdesc="The Perl Monitoring::Plugin modules which is used to streamline writing Naemon, Nagios, Icinga or Shinken (and compatible) plugins."
_dist=Monitoring-Plugin
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-params-validate' 'perl-class-accessor' 'perl-config-tiny' 'perl-math-calc-units')
options=('!emptydirs' purge)
source=(https://cpan.metacpan.org/authors/id/N/NI/NIERLEIN/$_dist-$pkgver.tar.gz)
md5sums=('894135697e46f771b37756ffc7cb9ff9')

# Setup environment to ensure installation in system perl and vender directory
clean_env() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null PERL_AUTOINSTALL=--skipdeps
}

build() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  /usr/bin/perl -I. Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
