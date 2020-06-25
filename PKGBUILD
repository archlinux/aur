# Contributor: Daniel Müllner <daniel@danifold.net>
pkgname=perl-crypt-random-tesha2
pkgver=0.01
pkgrel=5
pkgdesc='Random numbers using timer/schedule entropy.'
_dist=Crypt-Random-TESHA2
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/D/DA/DANAJ/$_dist-$pkgver.tar.gz")
sha256sums=('a0912b42c52be173da528d5527e40d967324bc04ac78d9fc2ddc91ff16fe9633')

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
