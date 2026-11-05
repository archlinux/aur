# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-datetime-hires
_dist=DateTime-HiRes
pkgver=0.04
pkgrel=2
pkgdesc='Create DateTime objects with sub-second current time resolution'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=DROLSKY
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('1c23159332c30f9eba54b75e6692be4dea8052243eaff3026c9c90b8b64bc395')

arch=(any)
depends=(perl perl-datetime)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
