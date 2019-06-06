# Maintainer: xiretza <xiretza+aur@gmail.com>
_perlmod="Apache-Session"
_modnamespace=Apache
pkgname=perl-apache-session
pkgver=1.93
pkgrel=1
pkgdesc="A persistence framework for session data"
arch=(any)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
checkdepends=('perl-test-deep' 'perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha512sums=('568653b5151df61dbbc4b034043e1d4be75642122ab920a13155c4abbe052e4d96915b1453eb9f2f06bd1159d95efef7ed5905b4d2f2b8c6fdd3711d0cf5dbe4')

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
