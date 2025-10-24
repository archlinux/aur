# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-xs-object-magic
_cpanname=XS-Object-Magic
pkgver=0.05
pkgrel=3
pkgdesc="Opaque, extensible XS pointer backed objects using sv_magic"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
options=('!emptydirs')
depends=("perl")
makedepends=('perl-extutils-depends' 'perl-module-install')
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/${_cpanname}-${pkgver}.tar.gz")
md5sums=('762eacb3d6ab1227cc8711cb6369fd79')

build() {
  cd  "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make -j1
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
