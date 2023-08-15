# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Robert F. Nash

pkgname=perl-webservice-musicbrainz
_pkgname=WebService-MusicBrainz
pkgver=1.0.6
pkgrel=1
pkgdesc="Web service API to MusicBrainz database"
arch=(any)
url="https://metacpan.org/release/WebService-MusicBrainz"
license=(PerlArtistic GPL)
depends=(perl-class-accessor perl-uri perl-xml-libxml perl-libwww perl-mojolicious)
options=(!emptydirs)
source=("https://search.cpan.org/CPAN/authors/id/B/BF/BFAIST/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b9cb8a4873c0a32575afbeaa57068a2b533dd3213d747b3577a378da2844b325e9b50477ccb3c5461b34a319078a59cf802be93f1cc094cb6f12c13c92c9611a')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}


