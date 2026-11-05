# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=perl-panotools-script
_dist=Panotools-Script
pkgver=0.29
pkgrel=1
pkgdesc='Perl/CPAN Module Panotools::Script : Panorama Tools scripting'
license=('GPL-2.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=BPOSTLE
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('95507d1e75ed1389cacd7731a1e62697c386eb71ea5ae2bf50ff7f70320c1f0a')

arch=(any)
depends=(
  perl
  perl-image-exiftool
  perl-image-size
  perl-libwww
  perl-uri
)
checkdepends=(hugin)
optdepends=(
  'zenity: GUI'
  'enblend-enfuse: enblend-* enfuse-* scripts'
  'imagemagick: entile'
  'hugin: tools for generating panorama projects'
)
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
