# Maintainer: Bernhard Walle <bernhard@bwalle.de>

pkgname=perl-postscript-simple
pkgver=0.09
pkgrel=1
pkgdesc="PostScript::Simple"
url="http://search.cpan.org/~mcnewton/PostScript-Simple-$pkgver/"
depends=('perl>=5.005')
license=('GPL')
options=('!emptydirs')
arch=('i686' 'x86_64')
source=(http://search.cpan.org/CPAN/authors/id/M/MC/MCNEWTON/PostScript-Simple-$pkgver.tar.gz)
md5sums=('fabef8f5bea0554df41b746e382932e7')
sha512sums=('28026060f91e7bcc2722df7e7097667aa2baaa85b1c558e08558fbee3395b0326e0564142e7729068afd13bdf523da32073fd6dbe56317db3e554445b4a04b18')

build() {
  cd "$srcdir/PostScript-Simple-$pkgver"
  eval `perl -V:archname`
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
          PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
          PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
          MODULEBUILDRC=/dev/null
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/PostScript-Simple-$pkgver"
  make DESTDIR=$pkgdir install
  find $pkgdir -name '.packlist' -exec rm  '{}' \;
  find $pkgdir -name '*.pod' -exec rm  '{}' \;
}
