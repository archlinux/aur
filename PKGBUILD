# Contributor: Chad Harp <chad.harp@mac.com>
pkgname=perl-criticism
pkgver=1.02
pkgrel=1
pkgdesc='Perl pragma to enforce coding standards and best-practices'
_dist=criticism
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-critic>=1.089')
checkdepends=('perl-io-string')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/T/TH/THALJEF/criticism/criticism-${pkgver}.tar.gz")
md5sums=('b1ee983972202b1b255e1a5d5c29be3e')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
