# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: andmars <andreas.marschall @ unitybox.de>

pkgname=perl-musicbrainz-discid
pkgver=0.06
pkgrel=2
pkgdesc="MusicBrainz::DiscID module"
_dist=MusicBrainz-DiscID
arch=(x86_64)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(glibc libdiscid perl perl-module-build)
options=(!emptydirs) #purge
source=("https://search.cpan.org/CPAN/authors/id/N/NJ/NJH/$_dist-$pkgver.tar.gz")
sha256sums=('ba0b6ed09897ff563ba59872ee93715bef37157515b19b7c6d6f286e6548ecab')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
