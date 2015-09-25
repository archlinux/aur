# Maintainer: Mark Grimes <mgrimes at peculier.com>

pkgname=perl-monitoring-plugin
pkgver=0.39
pkgrel=2
pkgdesc="A family of perl modules to streamline writing Naemon, Nagios, Icinga or Shinken (and compatible) plugins."
_dist=Monitoring-Plugin
arch=('any')
url="https://metacpan.org/module/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-params-validate' 'perl-class-accessor' 'perl-config-tiny' 'perl-math-calc-units')
options=('!emptydirs' purge)
source=(https://cpan.metacpan.org/authors/id/N/NI/NIERLEIN/$_dist-$pkgver.tar.gz)
md5sums=('c786ada6289bda2c4380d3df3b5185d5')

# Setup environment to ensure installation in system perl and vender directory
clean_env() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null PERL_AUTOINSTALL=--skipdeps
}

build() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  /usr/bin/perl Makefile.PL
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
