# Maintainer: Jose Riha < jose1711 gmail com >

pkgname=perl-curses-panels-menus-forms
pkgver=1.28
pkgrel=1
pkgdesc="Character screen handling and windowing (built with panels, menus and forms support)"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Curses"
license=('GPL' 'PerlArtistic')
depends=('perl' 'ncurses')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-$pkgver.tgz)
md5sums=('ed9f7ddf2d90f4266da91c3dc9fad9c9')
provides=('perl-curses')
conflicts=('perl-curses')

build() {
  cd  $srcdir/Curses-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL PANELS MENUS FORMS INSTALLDIRS=vendor
  sed -i 's%.*<form.h>.*%#include "/usr/include/form.h"%' c-config.h
  make
}

package() {
  cd  $srcdir/Curses-$pkgver
  make pure_install doc_install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
