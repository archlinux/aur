# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
pkgname=psx-mc-cli
pkgver=v0.2.1
pkgrel=1
pkgdesc='Crossplatform cli utilities for working with PSX memory card files.'
_dist=PlayStation-MemoryCard
arch=('any')
url="https://metacpan.org/pod/PlayStation::MemoryCard"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/G/GA/GAHAYES/$_dist-$pkgver.tar.gz")
sha512sums=('2dde79bd95f31319ea315981028837c5e7730b184051f3b09701d46b8956fed62a4860bffa239cef4f8136923188223da12779e8d816b3419fd39faba213bfb2')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  # export PERL_MM_USE_DEFAULT=1 
  export PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  # unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make DESTDIR="${pkgdir}" install
  cd "${pkgdir}/usr/bin/vendor_perl"
  mv * ../
  cd ..
  rmdir "vendor_perl"
}
