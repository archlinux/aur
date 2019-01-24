# Maintainer: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=perl-postscript-simple
pkgver=0.07
pkgrel=3
pkgdesc="PostScript::Simple"
url="http://search.cpan.org/~mcnewton/PostScript-Simple-$pkgver/"
depends=('perl>=5.005')
license=('GPL')
options=('!emptydirs')
arch=('i686' 'x86_64')
source=(http://search.cpan.org/CPAN/authors/id/M/MC/MCNEWTON/PostScript-Simple-$pkgver.tar.gz)
md5sums=('4f67d5aabff883aa111197528172e804')

build() {
  cd  $srcdir/PostScript-Simple-$pkgver
  eval `perl -V:archname`
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
          PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
          PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
          MODULEBUILDRC=/dev/null
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd  $srcdir/PostScript-Simple-$pkgver
  make DESTDIR=$pkgdir install
  find $pkgdir -name '.packlist' -exec rm  '{}' \;
  find $pkgdir -name '*.pod' -exec rm  '{}' \;
}
