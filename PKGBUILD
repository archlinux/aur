# Contributor: andmars <andreas.marschall @ unitybox.de>
pkgname=perl-musicbrainz-discid
pkgver=0.06
pkgrel=1
pkgdesc='This packages the MusicBrainz-DiscID distribution, containing the MusicBrainz::DiscID module!'
_dist=MusicBrainz-DiscID
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'libdiscid' 'perl-module-build')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/N/NJ/NJH/$_dist-$pkgver.tar.gz")
md5sums=('6579d43d270c965563f84fd5ffe0dde5')

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
