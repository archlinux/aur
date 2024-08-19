# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Robert F. Nash

pkgname=perl-webservice-musicbrainz
_pkgname=WebService-MusicBrainz
pkgver=1.0.7
pkgrel=1
pkgdesc="Web service API to MusicBrainz database"
arch=(any)
url="https://metacpan.org/release/WebService-MusicBrainz"
license=(PerlArtistic)
depends=(perl-class-accessor perl-uri perl-xml-libxml perl-libwww perl-mojolicious)
checkdepends=(perl-io-socket-ssl)
options=(!emptydirs)
source=("https://search.cpan.org/CPAN/authors/id/B/BF/BFAIST/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('9515de4949f365cc4ab3619433392c33dbeab9137c27788705eb852c7a31b4052843d3f541f814e31dbacbb10e3f524181e29ce4d177ba8753a1270dbde5229e')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test || :
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}


