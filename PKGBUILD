# Maintainer: Marco Munari <email in commits @allerta.it>
# this (Net::CIDR::Set) PKGBUILD template by Marco Munari
# might be suitable for other CPAN Arch packages adapting only:
#  perlname, pkgdesc, pkgver, pkgrel, license, depends,
#  the id/_/__/____ part of source and *sums.

pkgdesc="Manipulate sets of IP addresses"
perlname='Net::CIDR::Set'	# the perl nodule name
cpanname=${perlname//::/-} 	# repalces :: with - and keep the case
pkgname=perl-${cpanname@L}	# perl- followed by $cpanname in lower case
pkgver='0.19'
pkgrel='1'
source=("https://cpan.metacpan.org/authors/id/R/RR/RRWO/$cpanname-$pkgver.tar.gz")
sha512sums=(6ea7c86274d2a0c5f3adabb9b3fa540e359d9bd20bbb311cbbbb6cdda9905b1bd8d77288548859496aedccafbb434cd88c28fc1ce888c1595b97fc288f59cc87)
license=(Artistic-1.0-Perl GPL-1.0-or-later)
depends=(perl)
makedepends=()
# variables below are computed, likely siotable for many CPAN modules
url=https://metacpan.org/dist/$cpanname
arch=(any)
options=(!emptydirs)
_distdir="$cpanname-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
