# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: andmars <andreas.marschall @ unitybox.de>

pkgname=perl-musicbrainz-discid
pkgver=0.06
pkgrel=3
pkgdesc="MusicBrainz::DiscID module"
arch=(x86_64)
url="https://metacpan.org/release/MusicBrainz-DiscID"
license=(MIT)
depends=(glibc libdiscid perl perl-module-build)
options=(!emptydirs) #purge
source=("https://search.cpan.org/CPAN/authors/id/N/NJ/NJH/MusicBrainz-DiscID-$pkgver.tar.gz")
sha256sums=('ba0b6ed09897ff563ba59872ee93715bef37157515b19b7c6d6f286e6548ecab')

build() {
  cd "MusicBrainz-DiscID-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "MusicBrainz-DiscID-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "MusicBrainz-DiscID-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  install -D LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
