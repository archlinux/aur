# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="Apache-Session"
_modnamespace=Apache
pkgname=perl-apache-session
pkgver=1.94
pkgrel=2
pkgdesc="A persistence framework for session data"
arch=(any)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
checkdepends=('perl-test-deep' 'perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('796874e25dfc38a45998f8e13c3dabda779c9590c768ddc706a7bdae4b9e4b74ea457617c0079dd6d8168d97c19428d7609af00d5db218ad545f3c7dd0c0b825')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
