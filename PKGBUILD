# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=perl-gnome2-wnck+
pkgver=0.16
pkgrel=4
pkgdesc="Perl interface to the Window Navigator Construction Kit (improved)"
arch=('i686' 'x86_64')
license=("GPL" "PerlArtistic")
url="http://search.cpan.org/dist/Gnome2-Wnck"
provides=('perl-gnome2-wnck')
conflicts=('perl-gnome2-wnck')
depends=('gtk2-perl' 'libwnck+')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/Gnome2-Wnck-${pkgver}.tar.gz"
	"libwnck+.patch")
md5sums=('439f4569ffd7af96ef1d3feaab23760e'
         'ae7baf7c409334354d2aaa244ff316f7')

prepare() {
  cd Gnome2-Wnck-${pkgver}
  patch -Np2 -b -z .orig <../libwnck+.patch
}

build() {
  cd Gnome2-Wnck-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Gnome2-Wnck-${pkgver}
  make install DESTDIR=${pkgdir}
}
