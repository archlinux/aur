# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=perl-gnome2-gconf
pkgver=1.044
pkgrel=4
pkgdesc="Perl interface to the GConf configuration database"
arch=('i686' 'x86_64')
license=("GPL" "PerlArtistic")
url="http://search.cpan.org/dist/Gnome2-GConf"
depends=('gtk2-perl' 'gconf' 'glib-perl')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig')
options=('!emptydirs')
provides=("gconf-perl")
source=("http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/Gnome2-GConf-${pkgver}.tar.gz"
	removed-gconf_engine_key_is_writable.patch)
sha256sums=('875cb87bff28340c15c9bda9b645b5af8002d9b471363d5475532bc1d34e1df2'
            '4e860bb4978642b8360093ab21697ba9d10156c65293b8b6ee93463a86edce6e')

prepare() {
  cd Gnome2-GConf-${pkgver}
  patch -Np1 -i "$srcdir"/removed-gconf_engine_key_is_writable.patch
}

build() {
  export PERL_USE_UNSAFE_INC=1
  cd Gnome2-GConf-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd Gnome2-GConf-${pkgver}
  make install DESTDIR="$pkgdir"
}
