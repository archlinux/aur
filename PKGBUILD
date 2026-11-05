# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=perl-panotools-script
_dist=Panotools-Script
pkgver=0.28
pkgrel=2
pkgdesc='Perl/CPAN Module Panotools::Script : Panorama Tools scripting'
license=('GPL-2.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=BPOSTLE
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('2e13fb3255f048c2282b9f10c0616053d4f6f4e4c67e978ef4c53bab3919d561')

arch=(any)
depends=(perl)
checkdepends=(hugin)
optdepends=(
  'zenity: GUI'
  'enblend-enfuse: enblend-* enfuse-* scripts'
  'imagemagick: entile'
  'perl-image-size: erect2* and few other scripts'
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
