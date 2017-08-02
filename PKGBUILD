# Maintainer: Daniel Fernandez Rodriguez <gmail.com daferoes>
pkgname=perl-authen-krb5
pkgver=1.9
pkgrel=1
pkgdesc='Perl/CPAN module Authen::Krb5'
arch=('any')
url="http://search.cpan.org/~jhorwitz/Krb5/"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHORWITZ/Krb5-$pkgver.tar.gz")
md5sums=('b8bb8feb0b79464d04d17f472872b03e')

build() {
  cd "${srcdir}/Krb5-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  /usr/bin/make
}

check() {
  cd "${srcdir}/Krb5-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/Krb5-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR=$pkgdir/
  /usr/bin/find $startdir/pkg -name '.packlist' -delete
  /usr/bin/find $startdir/pkg -name '*.pod' -delete
}
