# Maintainer: John Regan <john@jrjrtech.com>
pkgname=perl-object-import
pkgver=1.005
pkgrel=1
pkgdesc='Perl Object::Import CPAN module'
_dist=Object-Import
arch=('any')
url="http://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-mro-compat')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/C/CO/CORION/${_dist}-${pkgver}.tar.gz")
md5sums=('3007a2d1cbb139aa5cb1c0870a8c08e6')

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

