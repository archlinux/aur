# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-xs-object-magic
_cpanname=XS-Object-Magic
pkgver=0.05
pkgrel=2
pkgdesc="Opaque, extensible XS pointer backed objects using sv_magic"
arch=('i686' 'x86_64')
url="http://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
options=('!emptydirs')
makedepends=('perl-extutils-depends' 'perl-module-install')
source=("http://cpan.metacpan.org/authors/id/F/FL/FLORA/${_cpanname}-${pkgver}.tar.gz")
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/${_cpanname}-${pkgver}.tar.gz")
md5sums=('762eacb3d6ab1227cc8711cb6369fd79')
sha512sums=('8927ab903f95d4f14a1602b3b4040dc9351f3348249a37e93dbf5cc2417bbde3b5c9a7512436e58b6a16fa48f6f4b55a300951560971d457814e8ef5044e6469')

build() {
  cd  "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make -j1
}

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
  _perl_depends
}
