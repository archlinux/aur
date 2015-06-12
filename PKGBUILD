# This PKGBUILD was inspired by cpan4pacman
# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=perl-proc-parallelloop
_cpanname=Proc-ParallelLoop
pkgver=0.5
pkgrel=2
pkgdesc="Parallel looping constructs for Perl programs"
arch=('any')
url="http://search.cpan.org/~bdarrah/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/B/BD/BDARRAH/${_cpanname}-${pkgver}.tgz) 
md5sums=('cc60f8a69454d64cc5a0f0b57171b13c')

build() {
  cd $srcdir/${_cpanname}-${pkgver}
  sed -i '/^auto_install/d' Makefile.PL
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
